Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9F018038
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Dec 2023 11:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpAFonRI"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e51a7545dso2020119e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Dec 2023 03:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703243693; x=1703848493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=422E8D0hJIO/x9qlN5M/YDPeDy51iO5eXq4u7UbXCT8=;
        b=DpAFonRIxZXpojTK454UXQ5hXBGhpNNktHRjQyCiWcfht16JR7oaaYXQoHKwn4Yav3
         1Bo7EW7IHIsXTD+upO5KYSTceHdIyYDSuEcMHR/ls5cxpWzId+pH/oLosq0lvPAMiDI2
         mvPGjFXWbP620lEmycmW5MMmiipHAVVfQCplRAOWU5DNBwLltdJebLXCg9ZxurqxPclt
         mEmnZ0dB8GJISt/uZtEZNgl1Rs35yWOGzMGx1LvNUgmVIqPXTua1tgVHtGUIUXksErTk
         7VTnEnsAIyRxfhFkDtDQY8w+1t1oZiStlFunTSnd6UiuS9+COHTThCZFFJ12HPrEODqj
         5IuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703243693; x=1703848493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=422E8D0hJIO/x9qlN5M/YDPeDy51iO5eXq4u7UbXCT8=;
        b=uhNt15K3LM/MWMnvR3zEKLf0k3+TYaXUhBoFwVd/hpoVMzMRZYUpIJ8M8SQryaNASG
         pn5QINtrmqYFnnLi2aQFKsZ5CFA5MATO0swAEoek/f9Vs5ocxVgCtUBR5tCXtyM+zTZ3
         KZWv7OBCm1er1Zgk+DLUPJDAzVhF9UiU5w/DyGdgnXexll08T8HHBVB5pUwyjI967Q0J
         0PyuL/83lKv2WjVTtiYEVmGo/8ZzxMms8DsN60jbfFpGRx2QAio60Ws+7G0Ik5hKaX/W
         /3jAnlleejOQdaMpMpDodidCyNTaymbzfhtc0Vmyn0i3TftYC4BOqVYxYMGcMUbMSnLl
         5ZSA==
X-Gm-Message-State: AOJu0Ywx6JLkTQwmJgtT9oECax3VDYwjIF3QIswCdFl8fOSD7Ym+7ekc
	1ZsgO2k1mn3SlYhXQ9FOJcw=
X-Google-Smtp-Source: AGHT+IHvAdtVCOCM0VreRerqB83H12IHnADRmj9a8fDFQRtDWT3/nlvul6XbQlcen4QGsNI+A1vNAA==
X-Received: by 2002:ac2:4db0:0:b0:50e:375e:735f with SMTP id h16-20020ac24db0000000b0050e375e735fmr494437lfe.74.1703243693363;
        Fri, 22 Dec 2023 03:14:53 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.91])
        by smtp.gmail.com with ESMTPSA id es15-20020a056402380f00b0055267663784sm2420469edb.11.2023.12.22.03.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 03:14:52 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH v3 2/3] cpufreq: sun50i: Add support for D1's speed bin decoding
Date: Fri, 22 Dec 2023 12:14:06 +0100
Message-Id: <20231222111407.104270-3-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231222111407.104270-1-fusibrandon13@gmail.com>
References: <20231222111407.104270-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for decoding the efuse value read from D1 efuse speed
bins, and factors out equivalent code for sun50i.

The algorithm is gotten from

https://github.com/Tina-Linux/linux-5.4/blob/master/drivers/cpufreq/sun50i-cpufreq-nvmem.c#L293-L338

and maps an efuse value to either 0 or 1, with 1 meaning stable at
a lower supply voltage for the same clock frequency.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index e8c2a1dc3..26bb5217b 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -29,6 +29,29 @@ struct sunxi_cpufreq_data {
 	u32 (*efuse_xlate)(u32 speedbin);
 };
 
+static u32 sun20i_efuse_xlate(u32 speedbin)
+{
+	u32 ret;
+
+	switch (speedbin & 0xffff) {
+	case 0x5e00:
+		/* QFN package */
+		ret = 0;
+		break;
+	case 0x5c00:
+	case 0x7400:
+		/* QFN package */
+		ret = 1;
+		break;
+	case 0x5000:
+	default:
+		/* BGA package */
+		ret = 0;
+	}
+
+	return ret;
+}
+
 static u32 sun50i_efuse_xlate(u32 speedbin)
 {
 	u32 efuse_value;
@@ -46,6 +69,10 @@ static u32 sun50i_efuse_xlate(u32 speedbin)
 		return 0;
 }
 
+struct sunxi_cpufreq_data sun20i_cpufreq_data = {
+	.efuse_xlate = sun20i_efuse_xlate,
+};
+
 static struct sunxi_cpufreq_data sun50i_cpufreq_data = {
 	.efuse_xlate = sun50i_efuse_xlate,
 };
@@ -54,6 +81,9 @@ static const struct of_device_id cpu_opp_match_list[] = {
 	{ .compatible = "allwinner,sun50i-h6-operating-points",
 	  .data = &sun50i_cpufreq_data,
 	},
+	{ .compatible = "allwinner,sun20i-d1-operating-points",
+	  .data = &sun20i_cpufreq_data,
+	},
 	{}
 };
 
@@ -182,6 +212,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
 
 static const struct of_device_id sun50i_cpufreq_match_list[] = {
 	{ .compatible = "allwinner,sun50i-h6" },
+	{ .compatible = "allwinner,sun20i-d1" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sun50i_cpufreq_match_list);
-- 
2.30.2

