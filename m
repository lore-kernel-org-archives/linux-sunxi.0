Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A20017D2
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Jan 2023 08:57:33 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so3122916wms.2
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Jan 2023 00:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLh9gLAmjmKtRy5q73jgqvg8UmN0Ojzfcs9IN4Tn3io=;
        b=HlOp+ZzuuUNGOd5tA2tWo3ZGkj59h25nLkmRpQfVDe/ZosO8xHcnoQ01C9MGhepaP7
         bDAEE7V9bEwWRM+0oWbiCmhFDBGWC+1nI189u+aNX/D2zvjgPY53uxsOpKyL9F2vbFir
         MUH9uJhYEVaUEqQb0cx8MapBMo7SI7xjAlmcs15hZAZIZaC8Mn9tYy1O5BfGHrpOaSAZ
         1zp6nU31KvCYSo+5LW4TkVufRzSyfgkqQ4MwnM3fupwfLfm6hf0DhPMwroyHGlQuwp3V
         9YCJH8sGLi73F8JFOoaNpdWz6qjnolIW9RaSKaonT+Rp7uPzgyw4jTXGDPMHFe7FViYW
         B15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLh9gLAmjmKtRy5q73jgqvg8UmN0Ojzfcs9IN4Tn3io=;
        b=XEE4J9b1s3i0YGU2vvMyZ/YhzidFo9J4lAQjTZrBKZsav+ejVfV6Rp8PttFrDSLQ9G
         67qOynMIgO8WfDYfKEa8ZrIQj8DLy1EwGHcBt8EcGruSBQkyw40FDTRC6+IJPigG1url
         PbIbIHOIpaT4H4OMTFAeuXfyJfjT0AA+lHWy1E4p0FbKg24HgoK9nbCKFmvEXU63ifQb
         tVgCqk0QUEekTqMG5wdx1ucKn4A9yoCmXxI9jBSiFCG27N74NdCPmpHFxmPCCh4+qWio
         Yuptbf3rUlifFjhBblWz4nwXhjrBz1XUqh88y7zevFVfrKsO77/CUNfD9BaFcQFj77dS
         CTTg==
X-Gm-Message-State: AFqh2kqZhi5x4++ATFNdnY5/8oSwBdJDnvvKzeLUJ84Nm0yjHFpT8+Fu
	kEFTkVjLsACgKavNgXpzzt1fig==
X-Google-Smtp-Source: AMrXdXtPATBJIPGHO0muRWjbnexaaMeh6KMlt8hH9FxqJjkYVKtHLyQf4msXY2Ls0rl7zsDWKo4Zcw==
X-Received: by 2002:a05:600c:3b17:b0:3cf:7397:c768 with SMTP id m23-20020a05600c3b1700b003cf7397c768mr13153310wms.30.1674205051416;
        Fri, 20 Jan 2023 00:57:31 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l18-20020a1c7912000000b003db00747fdesm1612040wme.15.2023.01.20.00.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 00:57:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tony Huang <tonyhuang.sunplus@gmail.com>,
	Li-hao Kuo <lhjeff911@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Markus Pargmann <mpa@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: mmc: correct pwrseq node names
Date: Fri, 20 Jan 2023 09:57:22 +0100
Message-Id: <20230120085722.171965-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120085722.171965-1-krzysztof.kozlowski@linaro.org>
References: <20230120085722.171965-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Node names should be generic and should not contain underscores.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml   | 2 +-
 Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml | 2 +-
 Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
index 911a5996e099..588be73168fa 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
@@ -41,7 +41,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    sdhci0_pwrseq {
+    pwrseq {
       compatible = "mmc-pwrseq-emmc";
       reset-gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
     };
diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml
index 3397dbff88c2..b35e00e8c65e 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml
@@ -35,7 +35,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    wifi_pwrseq: wifi_pwrseq {
+    pwrseq {
       compatible = "mmc-pwrseq-sd8787";
       powerdown-gpios = <&twl_gpio 0 GPIO_ACTIVE_LOW>;
       reset-gpios = <&twl_gpio 1 GPIO_ACTIVE_LOW>;
diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
index 64e3644eefeb..00feaafc1063 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
@@ -55,7 +55,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    sdhci0_pwrseq {
+    pwrseq {
       compatible = "mmc-pwrseq-simple";
       reset-gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
       clocks = <&clk_32768_ck>;
-- 
2.34.1

