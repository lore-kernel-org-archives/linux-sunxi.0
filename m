Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324E82C81
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Oct 2021 10:20:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aferraris)
	with ESMTPSA id CE78F1F44DC5
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Martin Kepplinger <martink@posteo.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Lucas Stach <dev@lynxeye.de>,
	Angus Ainslie <angus@akkea.ca>,
	Guido Gunther <agx@sigxcpu.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Eddie Cai <eddie.cai.linux@gmail.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Brian Norris <briannorris@chromium.org>,
	Dan Johansen <strit@manjaro.org>,
	Simon South <simon@simonsouth.net>,
	Matthias Brugger <mbrugger@suse.com>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: [PATCH 4/4] arm64: dts: rockchip: add 'chassis-type' property
Date: Sat, 16 Oct 2021 12:20:25 +0200
Message-Id: <20211016102025.23346-5-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016102025.23346-1-arnaud.ferraris@collabora.com>
References: <20211016102025.23346-1-arnaud.ferraris@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A new 'chassis-type' root node property has recently been approved for
the device-tree specification, in order to provide a simple way for
userspace to detect the device form factor and adjust their behavior
accordingly.

This patch fills in this property for end-user devices (such as laptops,
smartphones and tablets) based on Rockchip ARM64 processors.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts      | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts    | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts
index e6c1c94c8d69..31ebb4e5fd33 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts
@@ -16,6 +16,7 @@ / {
 		     "google,bob-rev7", "google,bob-rev6",
 		     "google,bob-rev5", "google,bob-rev4",
 		     "google,bob", "google,gru", "rockchip,rk3399";
+	chassis-type = "convertible";
 
 	edp_panel: edp-panel {
 		compatible = "boe,nv101wxmn51";
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
index 2bbef9fcbe27..6863689df06f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
@@ -24,6 +24,7 @@ / {
 		     "google,kevin-rev9", "google,kevin-rev8",
 		     "google,kevin-rev7", "google,kevin-rev6",
 		     "google,kevin", "google,gru", "rockchip,rk3399";
+	chassis-type = "convertible";
 
 	/* Power tree */
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi
index 61afb5f0f15b..355c61fb7b42 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi
@@ -8,6 +8,7 @@
 #include "rk3399-gru.dtsi"
 
 /{
+	chassis-type = "tablet";
 	/* Power tree */
 
 	/* ppvar_sys children, sorted by name */
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index dae8c252bc2b..c2f021a1a18f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -17,6 +17,7 @@
 / {
 	model = "Pine64 Pinebook Pro";
 	compatible = "pine64,pinebook-pro", "rockchip,rk3399";
+	chassis-type = "laptop";
 
 	aliases {
 		mmc0 = &sdio0;
-- 
2.33.0
