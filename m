Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53BA3570AE
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Nov 2025 19:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456105; cv=none; b=do3mOTmMyOGEi4iS9dznmlK0hSxKEDMKvgqFbWMv3ZXpbBUXZTdlvDNJ7awHJrjkcho1lP6y/rE/Ml6FUkBxqpK8bVMfQip5DM2t0QfCt28EdU3iCGMcRbWcAApm6Hc11Kyq1R6W1nqBSYP4/MFIhVY2236qvWNo6fWQsROUk7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456105; c=relaxed/simple;
	bh=81jTJshG5U8dunGjPlokrsbh1X84C4sADnDFTx0hch0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nFrOMX0c/1FqG3xGsJDq4IANzg6xdFBaDUeMDCWxXKKNb4LeBK7b6g71GyZbSemJ+RB51DKU5iYzE7oYOIcJGBHu7N227sLfPaGt6gUSvUjOkobkwOOxqqliQDhtPrF2T15LQD+aWjy6TlJtcIJtebYTDduvqrogld1QHPCpqIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sABWpagT; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sABWpagT"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7128683174so19878866b.2
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Nov 2025 11:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456102; x=1763060902; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTTwfl+8zqu4m1wm1arK7XbgGiT9bQGfagDjMk+wU6o=;
        b=sABWpagT336Dn92wj+i0MrD2ql1cmVgJL/jxMuDxpHIaN6SQvtBucRfh0mx46u0lJk
         Nie8A7HGM1LkVcXM9Ph0N/S2ODTyUoYqy041Ur/iN0Qy8GNDJagwaAsVY5+5GR2+n1WO
         jPE+13yVCwCE/Gu6VtZSlPStjDInwesVxF9cvB6PQlkqtkPQglD1rcys/5pVVC2vVism
         gSE7qBiFN2Zl7M0ZL9uOZjeZguTzwxCC9B/i9NoFy8DDZsHNylYBa9umDydy4Y4OR+KD
         hyHvJbAdDCZTXwZK2Vi3Sc5Z9DA0BtLuspDQ/vBDG5k1ZEPKtT/xJho8NxLbUzCH6tlk
         L5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456102; x=1763060902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lTTwfl+8zqu4m1wm1arK7XbgGiT9bQGfagDjMk+wU6o=;
        b=j5FF7AHWkCkm4rE6o+fZzkpCoEHbYaRwX3OXAPu+L4/znL+5t31gMDqbpoxXvynWuW
         KX2l1LUegvRs41htx1XUbiPokYfFXvHsRH/NvguFp8p8+ZFib2yuuRg6qDd0va2XgI+S
         8MUUUbOjhGrKfMcidvxtFOrPunEb3XXbLoqgd4slbuR6aM5S2hlMi29wBEMbq0Xk+Fr3
         5W/YYBb5LyhfbDqx0B1BjGhGAkqXtYbd2+c2LRRfIWHDYRGiXwVFp4RikWVKFZq78R+e
         YfF/Y3Up80QuwNs5dBPdv8XY3+b5G9s0wH5RRZKbIhYdXFaZbaA/yyAADFNoUD3LN03D
         PJfA==
X-Forwarded-Encrypted: i=1; AJvYcCU/l2ttYuBhZOS/z09DMLfP/t0DP2+vX3ejzFKKpIpzX2L/6RcaoaXDDYHb4Y0Kh0LhZcfQgnuAnx8NrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwooMummcY2OCyQ3dsEolBcr0x5Iq2SXaoEjk+xfZo+CBWfTTtn
	kDV4K9v7JK1Cf8/V4agIxivanPzdAAOB2sm4cllawaB+N7nvEzUJylS1Y6REI5OvuiA=
X-Gm-Gg: ASbGncu2c9KLGay/Jbz9rwJRUJtNVSvrG6iDEn2y2qD72Xi3ENHAQkNFi7DzSq9hd4C
	9gm5TutEfHW//JrKNRgBqBIrUjWt1eJW9ORNW4XM/HmVZ3bmzJgeKaM3L8MOjc4ARpsKEKRx6FA
	I0WlNOyZXf2hgEfLG1gLNtIyoZmLYxHIgsnmu9b+9W7KmB90950KjQtWmkANnaN0/7k3t0k+VEI
	x2+4rmimoHM96c02zcT5IIvG1H0liIxiZwskr5ugH7I3smDP6W6giBt54eP3Unin6C/AVAE9z5N
	1XsGpplsQQo44h58+/8SyDTecO4EFKJniNwMBb0bSl8Z3GhbzDDlPwSdJCSwJhMld13gKQYxXCz
	mfcYqqA8/l6ZLrh1q7t4n6YOa0S1e6Ursf8jhYgTPTw6hT8UiaBB1fZkz0g4ZQkzyQuvcEDyldB
	6HEqRwfLK9l6PvPy/x
X-Google-Smtp-Source: AGHT+IEf35hi/Mvu2pqQNB6ZUXhOFjK+2PFxyy+sVLCuTD++/QgA8I/C3DT2L72+VZdgncmFcO3C8w==
X-Received: by 2002:a17:907:60d5:b0:b6d:6d44:d255 with SMTP id a640c23a62f3a-b72c085b9ffmr22301066b.1.1762456101774;
        Thu, 06 Nov 2025 11:08:21 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:13 +0100
Subject: [PATCH 06/13] cpuidle: big_little: Simplify with
 of_machine_device_match()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-6-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=81jTJshG5U8dunGjPlokrsbh1X84C4sADnDFTx0hch0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIOPVy2nJb9/aZGGihJZJb6YzWNYbITaU/JD
 /wAIbe0weqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyDgAKCRDBN2bmhouD
 1+/5D/4twhEWhy32a6SbzdPRfB3gSy75fyN8B5lREUBuB3lg+/Q20TtmadU87drCAs82yGBNucd
 GykHkO6pu4SM+UwePyZ6VPEVv6ZgXHrJNtRFG1XlIm8Q/AygPPl4xucn/naHXrWq/XnN4qNsWF+
 iGgGwG1JycizeDM8lsEpLS1ye5J7N4pEAShKgxBG9AsQrGb8cNPu+z3DWBof+lyhu3vH5GYwFtn
 /taEpeXS1kk4gbPvr0LKInH3SS1fTM25K6LO+6Kzi3XpXKh6UecpyRHpCSRf4HXlWEF+UF0uaZw
 dY3a+MdF3zn6XyR/fHaodAF/27kNp1Aljz5kVFWIj9yTeNHgGeDhatQboZaGfFLmuHGj2jOv8H1
 jo1n3AR+1hWN95bLIMnN9g7c+SOivA1B5Vvy6VyEZvPHTxHMFxkgAXobBCeHn9UzjInGlL3A8fF
 QHbTzdUu3RYgvk9eI6qB1FRWjuUcd3KOVQIkZBXZ0nX+uq6xrDyqNtxf3EeigO5HIZwGh0pAg3b
 KDdcUP8N3WzU053nG6pPCIEb4H/hKU4OPtn+SrP9g2R+QnS9X235mO91RycPcBKIBE1kRGwMlTr
 fuLMetgh3RS7x/PKnyAnqE8rGVJZamVvtwkEbRsgJocNyDBnYes1oTn4ozkObw33ys20kFRMJzc
 q3b4Z2KUE6y+epg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/cpuidle/cpuidle-big_little.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-big_little.c b/drivers/cpuidle/cpuidle-big_little.c
index 4abba42fcc31..08f6bf2f6409 100644
--- a/drivers/cpuidle/cpuidle-big_little.c
+++ b/drivers/cpuidle/cpuidle-big_little.c
@@ -166,20 +166,11 @@ static const struct of_device_id compatible_machine_match[] = {
 static int __init bl_idle_init(void)
 {
 	int ret;
-	struct device_node *root = of_find_node_by_path("/");
-	const struct of_device_id *match_id;
-
-	if (!root)
-		return -ENODEV;
 
 	/*
 	 * Initialize the driver just for a compliant set of machines
 	 */
-	match_id = of_match_node(compatible_machine_match, root);
-
-	of_node_put(root);
-
-	if (!match_id)
+	if (!of_machine_device_match(compatible_machine_match))
 		return -ENODEV;
 
 	if (!mcpm_is_available())

-- 
2.48.1

