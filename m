Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E77F6FAD
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Nov 2022 17:34:23 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 98845C3DDE
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Nov 2022 17:17:58 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 655B060006;
	Mon, 21 Nov 2022 17:17:43 +0000 (UTC)
From: Quentin Schulz <foss+kernel@0leil.net>
To: Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Samuel Holland <samuel@sholland.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bastien Nocera <hadess@hadess.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH RFC v2 1/7] Input: goodix - fix reset polarity
Date: Mon, 21 Nov 2022 18:17:18 +0100
Message-Id: <20221103-upstream-goodix-reset-v2-1-2c38fb03a300@theobroma-systems.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103-upstream-goodix-reset-v2-0-2c38fb03a300@theobroma-systems.com>
References: <20221103-upstream-goodix-reset-v2-0-2c38fb03a300@theobroma-systems.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.1
Content-Transfer-Encoding: quoted-printable

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D

The reset line is asserted for selecting the I2C target address and then=0D
deasserted.=0D
=0D
This inverted logic works because the boards using this touchscreen=0D
controller also invert the polarity of their reset GPIO.=0D
=0D
Instead of depending on this double-inversion of meaning, let's *assert*=0D
the line.=0D
=0D
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
---=0D
Changes in v2:=0D
- implemented ACPI support as suggested by Hans,=0D
- added comment on how to read gpiod_request_output and the GPIO DT polarit=
y,=0D
=0D
 drivers/input/touchscreen/goodix.c | 45 +++++++++++++++++++++++++++++-----=
----=0D
 1 file changed, 35 insertions(+), 10 deletions(-)=0D
=0D
diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen=
/goodix.c=0D
index a33cc7950cf5b..da10cbb6f8264 100644=0D
--- a/drivers/input/touchscreen/goodix.c=0D
+++ b/drivers/input/touchscreen/goodix.c=0D
@@ -742,8 +742,25 @@ int goodix_reset_no_int_sync(struct goodix_ts_data *ts=
)=0D
 {=0D
 	int error;=0D
 =0D
-	/* begin select I2C slave addr */=0D
-	error =3D gpiod_direction_output(ts->gpiod_rst, 0);=0D
+	/*=0D
+	 * begin select I2C slave addr by activating/asserting RESET.=0D
+	 *=0D
+	 * The value passed to gpiod_direction_output is decorrelated from the=0D
+	 * actual physical state of the line. The 1 value here is just to=0D
+	 * specify the *assertion* of the line, its meaning being dependent on=0D
+	 * the HW design of the system.=0D
+	 *=0D
+	 * DT-based systems need to specify the GPIO level in which the reset is=
=0D
+	 * active. Since the touchscreen controller is in reset when its RESET=0D
+	 * line is low, it is the level of the GPIO that results in the RESET=0D
+	 * pin on the touchscreen controller side being low. In a HW design in=0D
+	 * which the GPIO is directly connected to the touchscreen controller=0D
+	 * RESET pin, this would be GPIO_ACTIVE_LOW.=0D
+	 *=0D
+	 * ACPI systems do not have the ability to specify the level of the GPIO=
=0D
+	 * and they are therefore all assumed active low.=0D
+	 */=0D
+	error =3D gpiod_direction_output(ts->gpiod_rst, 1);=0D
 	if (error)=0D
 		goto error;=0D
 =0D
@@ -756,7 +773,8 @@ int goodix_reset_no_int_sync(struct goodix_ts_data *ts)=
=0D
 =0D
 	usleep_range(100, 2000);		/* T3: > 100us */=0D
 =0D
-	error =3D gpiod_direction_output(ts->gpiod_rst, 1);=0D
+	/* Disable/de-assert RESET */=0D
+	error =3D gpiod_direction_output(ts->gpiod_rst, 0);=0D
 	if (error)=0D
 		goto error;=0D
 =0D
@@ -797,23 +815,30 @@ static int goodix_reset(struct goodix_ts_data *ts)=0D
 }=0D
 =0D
 #ifdef ACPI_GPIO_SUPPORT=0D
-static const struct acpi_gpio_params first_gpio =3D { 0, 0, false };=0D
-static const struct acpi_gpio_params second_gpio =3D { 1, 0, false };=0D
+static const struct acpi_gpio_params int_first_gpio =3D { 0, 0, false };=0D
+static const struct acpi_gpio_params int_second_gpio =3D { 1, 0, false };=
=0D
+=0D
+/*=0D
+ * The controller is in reset when the RESET GPIO is output low, so=0D
+ * set acpi_gpio_params.active_low appropriately.=0D
+ */=0D
+static const struct acpi_gpio_params rst_first_gpio =3D { 0, 0, true };=0D
+static const struct acpi_gpio_params rst_second_gpio =3D { 1, 0, true };=0D
 =0D
 static const struct acpi_gpio_mapping acpi_goodix_int_first_gpios[] =3D {=
=0D
-	{ GOODIX_GPIO_INT_NAME "-gpios", &first_gpio, 1 },=0D
-	{ GOODIX_GPIO_RST_NAME "-gpios", &second_gpio, 1 },=0D
+	{ GOODIX_GPIO_INT_NAME "-gpios", &int_first_gpio, 1 },=0D
+	{ GOODIX_GPIO_RST_NAME "-gpios", &rst_second_gpio, 1 },=0D
 	{ },=0D
 };=0D
 =0D
 static const struct acpi_gpio_mapping acpi_goodix_int_last_gpios[] =3D {=0D
-	{ GOODIX_GPIO_RST_NAME "-gpios", &first_gpio, 1 },=0D
-	{ GOODIX_GPIO_INT_NAME "-gpios", &second_gpio, 1 },=0D
+	{ GOODIX_GPIO_RST_NAME "-gpios", &rst_first_gpio, 1 },=0D
+	{ GOODIX_GPIO_INT_NAME "-gpios", &int_second_gpio, 1 },=0D
 	{ },=0D
 };=0D
 =0D
 static const struct acpi_gpio_mapping acpi_goodix_reset_only_gpios[] =3D {=
=0D
-	{ GOODIX_GPIO_RST_NAME "-gpios", &first_gpio, 1 },=0D
+	{ GOODIX_GPIO_RST_NAME "-gpios", &rst_first_gpio, 1 },=0D
 	{ },=0D
 };=0D
 =0D
=0D
-- =0D
b4 0.10.1=0D
