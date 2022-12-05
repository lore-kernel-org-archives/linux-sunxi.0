Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A7D7C
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 13:41:27 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 79BC4FF811;
	Mon,  5 Dec 2022 13:41:14 +0000 (UTC)
From: Quentin Schulz <foss+kernel@0leil.net>
To: Samuel Holland <samuel@sholland.org>,
	Bastien Nocera <hadess@hadess.net>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Angus Ainslie <angus@akkea.ca>,
	Ondrej Jirman <megous@megous.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Andy Gross <agross@kernel.org>,
	Aleksei Mamlin <mamlinav@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	David Jander <david@protonic.nl>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Peter Geis <pgwipeout@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Lukasz Majewski <lukma@denx.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Rob Herring <robh+dt@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	linux-input@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 2/9] Input: goodix - make gpiod_get honor GPIOD_ASIS
Date: Mon,  5 Dec 2022 14:40:31 +0100
Message-Id: <20221103-upstream-goodix-reset-v3-2-0975809eb183@theobroma-systems.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103-upstream-goodix-reset-v3-0-0975809eb183@theobroma-systems.com>
References: <20221103-upstream-goodix-reset-v3-0-0975809eb183@theobroma-systems.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.1
Content-Transfer-Encoding: 8bit

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

For some reason the ACPI GPIO lookup code (acpi_find_gpio followed by
acpi_gpio_update_gpiod_flags) will override the gpiod_flags
passed to gpiod_get() if it can determine a set of flags from the ACPI
GpioIo entry.

For output pins like the reset pin, this requires a pull bias to be set,
which often is not the case, so then the GPIOD_ASIS which we pass in is
used.

But if a pull bias is specified in the ACPI GpioIo entry for the reset
pin then that gets translated to GPIOD_OUT_LOW or GPIOD_OUT_HIGH meaning
we cannot guarantee the same behavior on all boards.

So this may cause unintended side-effects, c.f. commit a2fd46cd3dbb
("Input: goodix - try not to touch the reset-pin on x86/ACPI devices")
for some background.

This is something which we can fix though, we can force the ACPI GPIO
code to honor the GPIOD_ASIS we pass in by passing
ACPI_GPIO_QUIRK_NO_IO_RESTRICTION to the ACPI gpio mapping.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 drivers/input/touchscreen/goodix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index d73d4272a8ea5..1639f2f8a31e3 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -803,6 +803,7 @@ static int goodix_reset(struct goodix_ts_data *ts)
 		.name = _name, \
 		.data = _params, \
 		.size = _size, \
+		.quirks = ACPI_GPIO_QUIRK_NO_IO_RESTRICTION, \
 	}
 
 static const struct acpi_gpio_params first_gpio = { 0, 0, false };

-- 
b4 0.10.1
