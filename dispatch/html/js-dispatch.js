const { createApp } = Vue

createApp({
    data() {
        return {
            calls: [
                { id: 1, type: 'police', status: 'new', statusText: 'New', title: '911 Dispatch', message: 'The quick brown fox jumps over the lazy dog', distance: '1.6km', units: [{ callsign: 'PD13', type: 'police', status: 'active' }, { callsign: 'PD10', type: 'police', status: 'pending' }] },
                { id: 2, type: 'ems', status: 'dispatched', statusText: 'Dispatched', title: '912 Dispatch', message: 'The quick brown fox jumps over the lazy dog', distance: '2.6km', units: [{ callsign: 'PD13', type: 'police', status: 'active' }, { callsign: 'MD02', type: 'ems', status: 'pending' }] },
            ]
        }
    },
}).mount('#app');