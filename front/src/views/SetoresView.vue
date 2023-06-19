<template>
    <div class="titulo">
        <h1>Pátio</h1>
    </div>

    <div class="setores">
        <div class="setor" v-for="setor in setoresUnicos" :key="setor.area" :class="{
            azul: setor.cor === 'azul',
            branco: setor.cor === 'branco',
        }" @click="abrirModal(setor.area)">
            <span class="setor-label">{{ setor.area }}</span>
        </div>
    </div>

    <div class="modal" v-if="setorSelecionado">
        <div class="modal-content">
            <div class="modalTitulo">
                <span class="close" @click="FecharModal()">&times;</span>
                <h3>Setor {{ setorId }}</h3>
            </div>
            <table>
                <thead v-if="hasVeiculos">
                    <tr>
                        <th>Modelo</th>
                        <th>Preço</th>
                        <th>Quantidade</th>
                        <th>Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <template v-if="setorSelecionado.length > 0">
                        <template v-for="carro in setorSelecionado" :key="carro.id">
                            <template v-if="carro.quantidade > 0">
                                <tr>
                                    <td class="dadosTabela">{{ carro.modelo }}</td>
                                    <td class="dadosTabela">{{ carro.preco }}</td>
                                    <td class="dadosTabela">{{ carro.quantidade }}</td>
                                    <td class="dadosTabela">
                                        <button @click="abrirModalVenda(carro.id)">Vender</button>
                                    </td>
                                </tr>
                            </template>
                        </template>
                    </template>
                    <template v-else>
                        <tr>
                            <td class="dadosTabela" colspan="4">
                                Não há veículos nesta área.
                            </td>
                        </tr>
                    </template>
                </tbody>
            </table>
        </div>
    </div>

    <div class="modal" v-if="modalVendaAberto">
        <div class="modal-content">
            <div class="modalTitulo">
                <span class="close" @click="FecharModal()">&times;</span>
                <h3>{{ venda.modelo }} | {{ venda.preco }}</h3>
            </div>
            <div class="selectCampo">
                <label for="cliente" class="labelCampo">Cliente</label>
                <select v-model="venda.cliente" id="select-cliente" class="selectCliente">
                    <option v-for="cliente in clientes" :value="cliente.id">
                        {{ cliente.clientes }}
                    </option>
                </select>
            </div>
            <br />
            <div class="selectCampo">
                <label for="concessionaria" class="labelCampo">Concessionária</label>
                <select v-model="venda.concessionaria" id="select-concessionaria" class="selectCliente">
                    <option v-for="concessionaria in concessionarias" :value="concessionaria.id">
                        {{ concessionaria.concessionaria }}
                    </option>
                </select>
            </div>

            <div class="modalFooter">
                <button :class="{ 'botaoCinza': !venda.cliente || !venda.concessionaria }" @click="fecharVenda()"
                    :disabled="!venda.cliente || !venda.concessionaria">Confirmar</button>
            </div>
        </div>
    </div>
</template>
  
<script>
import axios from "axios";
import "select2/dist/css/select2.css";
import "select2";
import $ from "jquery";
import Swal from "sweetalert2";

export default {
    data() {
        return {
            setores: [],
            setorSelecionado: null,
            setorId: [],
            carroSelecionado: null,
            modalVendaAberto: false,
            clientes: [],
            venda: [],
            concessionarias: [],
        };
    },
    computed: {
        setoresUnicos() {
            const areas = Array.from(
                new Set(this.setores.map((setor) => setor.area))
            );

            // Ordenar as áreas em ordem crescente
            areas.sort((a, b) => a - b);

            return areas.map((area) => {
                const setor = this.setores.find((s) => s.area === area);
                return {
                    area: setor.area,
                    cor: setor.cor,
                };
            });
        },
        hasVeiculos() {
            if (Array.isArray(this.setorSelecionado)) {
                return this.setorSelecionado.some(carro => carro.modelo !== 'Sem Veículo');
            } else {
                return false;
            }
        }
    },

    mounted() {
        this.carregarSetores();
        this.carregarClientes();

    },
    methods: {
        async carregarSetores() {
            try {
                const response = await axios.get("http://localhost:3000/api/alocacao");
                this.setores = response.data;
            } catch (error) {
                console.error(error);
            }
        },
        async abrirModal(setor) {
            try {
                this.setorSelecionado = setor;
                this.setorId = setor;

                const response = await axios.get(`http://localhost:3000/api/automoveisPorArea/${setor}`);
                this.setorSelecionado = response.data;


            } catch (error) {
                console.error(error);
            }
        },
        async abrirModalVenda(carro) {
            try {
                this.carregarConcessionaria(carro);

                const response = await axios.get(`http://localhost:3000/api/automoveis/${carro}`);
                const modeloAutomovel = response.data[0];

                this.venda.modelo = modeloAutomovel.modelo;
                this.venda.preco = modeloAutomovel.preco;

                this.modalVendaAberto = true;
            } catch (error) {
                console.error('Erro ao obter o modelo do automóvel:', error);
            }

            this.setorSelecionado = false;
        },
        FecharModal() {
            if (this.setorSelecionado) {
                this.setorSelecionado = false;
                this.venda = []
            } else if (this.modalVendaAberto) {
                this.modalVendaAberto = false
                this.venda = []
            }
        },
        async carregarClientes() {
            try {
                const response = await axios.get("http://localhost:3000/api/clientes");
                this.clientes = response.data;
            } catch (error) {
                console.error(error);
            }
        },
        async carregarConcessionaria(carro) {
            try {
                const automovelId = carro;

                const response = await axios.get(`http://localhost:3000/api/concessionaria/${automovelId}`);
                this.concessionarias = response.data;
            } catch (error) {
                console.error(error);
            }
        },
        async fecharVenda() {
            this.modalVendaAberto = false;
            try {
                const automovelId = this.carroSelecionado;

                await axios.put(`http://localhost:3000/api/vendas/${automovelId}`);

                await Swal.fire({
                    icon: "success",
                    title: "Venda realizada com sucesso!",
                    text: "A venda foi concluída.",
                });
                this.venda = [];
            } catch (error) {
                console.error("Erro ao atualizar a quantidade do automóvel:", error);
            }
        }

    },
};
</script>
  
<style >


</style>
  