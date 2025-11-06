Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EB93590A9
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Nov 2025 19:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456122; cv=none; b=I2TaJga7gYyogumfJS7Zcn6i+gApTsYCU84nfRj1of7NzByQVTpYYgLKVcnUzTRjYbgk9Wyd0kAc6tBA1m3lK0mKCc5gqvjWjQE0rNwrG2GtP6estJPaIvDqgesO8Gcc/5/1qcgJ9eDqq3hOlDjVUh6m4Y5z1OzU4gQEZnRE0Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456122; c=relaxed/simple;
	bh=aS+78ja3p6OXPY5E9ndwnwq/bvuxECqbsbzsQlrHFPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=at0ODwHPEX5kL2b5KeNLO1z8fqVSx19mVaHTD4vcnTpxaRKcrqsBv/YXYCZK+6sXDpXOm3wI30Jgc3LMvUbxi3SsnGCjvOo/spBaJP7PjZs5smQ2aV3HSdDng5YtW6Zv0e4drLSJDI0dfSDLrXQOG6HGE14T782rokqlQDYIw20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbujSGc1; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbujSGc1"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b70b338426fso22736166b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Nov 2025 11:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456118; x=1763060918; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEcJAtodzbUC3xZVWApwBo4tG7vpFkamgYaCQUU+adg=;
        b=WbujSGc1Rv9UxIU+/bzesVA6XgMtuJAd0V35G1XZZ+5EXjSZGTwfGBr54gtQnpKb2M
         BVM54Bsq9kybjFb+QPGZ7CDrP7+hfGwSXFbW2wUvjjAy+D7YMnujxc0jRXXP7Mz5v39H
         pQ1/oGkd7Gjah2DqEikpfAk44kNfAY0kzBYmcfxkLl2+vSAMvY2su4l8L4wybEiKfXh3
         hbmpa14dU459qLcB2qkqaqQA+D7vHDgNLn4xTnQ+2WqCw2eqKT41zgI3ZlGcAn9y+SV/
         1az69Gne5X5RZe5fZIZP9cqB1ABCbNgwiJaGKDjZQ17oiAqDCB8he6rQIjalsXv9O8Oq
         AjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456118; x=1763060918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cEcJAtodzbUC3xZVWApwBo4tG7vpFkamgYaCQUU+adg=;
        b=mUGVQEg0n+YN51YXRVPeTa45ckZRGuaF83y5Ev9vm2vtKjklm4OXqvtAi400W8eOE+
         vRThTkTU6CmYH7wWNobASanMrH/tf1N9K6P5ubtZUjIllCkazMLmWkhf0ulrp/cyKGsa
         g7LohM/HoA/2TS1mABnX9lWaPFObERrZUKyvF6Xr3qnw8qLL1sXpZfBFC7FOctNfTpOW
         wVNnicEdKXI29RPko97Kp4oaoH9f4rd/UAynS9hIt93k8HvlKwEnPtY/RX7X89LvAfDN
         jtSpLEbt7LF07PajgZetEWViNDHExw7eqt3VPfjNgSUgzCFI/K3PewQ3U8sNbVoZY7zj
         GT1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5s1K/5EMFhbV0L7V/tJDBKhf+jy9yrt+5uGTCIffv+FqIDVLbOTu7Jdk+9hP5BZ/mH2DR/7tc9SfNUg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4aEhrVVUs4psa7D10+v3gZrvqXnDa73jxg/eKBLh7S7B37QjV
	6yWKknPIpZCqZ6vBhIa8SiajqfvHedeU0l4WueTeW+5PLzb8I6WRGz/2au+Nux5um1Q=
X-Gm-Gg: ASbGncvSw8sv/TNQa40xdJnhBzQa3w+a8UWpEc2PtBlxZDAlHdv++d2RdVGJxno6kN4
	ioOW+ZPGAM5uCFjCurNappyOlPkMRgxj2bPr361cF9qItNMNiwyZ/VcOZ/lnQzTl8OtUf9W+dtx
	rfi4oajl4QquxgctMqXPzKbH5StDHB50KRm0L1BOR/1abRbI64CJmLNqShq0p5qMZwTBzsQx8tF
	m5rdAl18CSVC8f1CQ0MX0C7xIcwkPQO16xtraHJ46Je75fRuJa295MQr+5j1tZ757slOdBAFQKE
	n00I7j7JmBeNxLxujXBoPnhOTu/Y1NG9g+7wajPqAPXuWjsK1J+lPNln54qTfvZxB/Y/p+S7nQ/
	Gi7dAhb/lKP/tHuPNNKBaw8Q4GS4mEfLGWAfrn94C0sRtRQyrgEEnCtyP6uy9znV4TmUlDwm07e
	x15IIollDvODSqTDVpLFClIps4X48=
X-Google-Smtp-Source: AGHT+IEG6JIHxsm0NSW77JVy6hqlVUyEbsXE+NHpA4hsr8vUkgMvS24h2IoWnZAH3XOZ5QWMzHmdwQ==
X-Received: by 2002:a17:907:3f24:b0:b65:c8b8:144f with SMTP id a640c23a62f3a-b72c0996c95mr16220166b.6.1762456118427;
        Thu, 06 Nov 2025 11:08:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:20 +0100
Subject: [PATCH 13/13] soc: tegra: Simplify with of_machine_device_match()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-13-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aS+78ja3p6OXPY5E9ndwnwq/bvuxECqbsbzsQlrHFPw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIU/bsdy2ckqomcJnNEJaYMWYw9A/Yk7qSg4
 /78uRfUhPeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyFAAKCRDBN2bmhouD
 1zSDD/0WA69UvlFQXYTOHuLcL+wvScWW8sP6X/fQsuharZFRRvPkmk5RKJ1H9q9haW5mFRgd8xZ
 kO4ELHeCytALDZhxzR3QwE4LgpseKDZSllt6k9bKnAGouD7wl63kISGTR95uVIILdEmQtH/OMYg
 9dplSgp+4dVxPa0TMzVjb0WV9RzYn9ubwlhRES5DFD5bkw7kpUYQY33eE2cmJlfu8p8On3ipNJy
 6bYBh7HG3mjy9NDDwKd81Dw7cMYRGCAV+Ce7NsEl5k92yn1B5nfokau0GlcFCUxhnsSZaUv36WN
 4TRVXpnSBeMhkM8HYEDdG/YqQFrTVm9ohoQrwVhSVRcjOU6I5YHA+OqDxvBRsjpV5YMXTa0JXi9
 GSoRXU2NxMxA8dXrc7ueXed+jGkJ2NNMBOTmQTjoOSU90vT6eQ0g+MQQl7/vUDIqba4kLTnLjsg
 qnj7S5s5q4cMGiqprqCXnP1Qei5JXuJtNsQzMlmH1GBncgQGLvI/8rwSqD8JGKZHVXHFXovLa7K
 O+juSa69kES3Y05oIwof7EKPSvvW+pOyi2uAXgt+v/ca2qUmbqicWLvSad49kbsc2SLlTGsBsxk
 dD6AtoUoZv3MGI7XcFgRReuI8yTr1b7oU3zSAcyqwA2aCLVxhUyBZr31EQaMVpQ9xST2iFnLrna
 O5LVFZW9cO0pqkw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/soc/tegra/common.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index dff6d5ef4e46..d82b7670abb7 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -27,17 +27,7 @@ static const struct of_device_id tegra_machine_match[] = {
 
 bool soc_is_tegra(void)
 {
-	const struct of_device_id *match;
-	struct device_node *root;
-
-	root = of_find_node_by_path("/");
-	if (!root)
-		return false;
-
-	match = of_match_node(tegra_machine_match, root);
-	of_node_put(root);
-
-	return match != NULL;
+	return of_machine_device_match(tegra_machine_match);
 }
 
 static int tegra_core_dev_init_opp_state(struct device *dev)

-- 
2.48.1

