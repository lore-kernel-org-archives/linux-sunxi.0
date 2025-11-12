Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B7D309DA8
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Nov 2025 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943359; cv=none; b=BYLelw+Kk9H6T0jPzf10mCclIIOkks5XZRoDGfvRSS+zp1iTrwgFl4LpDx26zb7EmqJQrHpxk5bt2+n2uJ0WSeltnwVYcRFIM6bM2Wo9oeLInpNySEUVfxFwtmeKx433TwtGWarSvc0Sg0q3mp9bNyk0vx1dcYHRwvoLaeN8utQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943359; c=relaxed/simple;
	bh=81jTJshG5U8dunGjPlokrsbh1X84C4sADnDFTx0hch0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XkbQLLCQacQuSgT4fzWyYqDqQpCE9f+7QwFgYZDnEPHLzcKgxSnq8KvfwdJ47zIyZHllD/LjuQqMcHSwq5lbfXFu83OAKwbWIWcd6HHBI41LXOr/qoojJvKbjCZmtDWp+x/xAgrOACadquu6m1pIr/OBGx9BaDE/bGCQ6MqY9Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZkPpHVI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZkPpHVI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4777af7c382so170105e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Nov 2025 02:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943355; x=1763548155; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTTwfl+8zqu4m1wm1arK7XbgGiT9bQGfagDjMk+wU6o=;
        b=yZkPpHVI48xE1kQu38K0wefXLoYBNZB4DbzhO9TQtTqY4eRMhreqjSl9Qfv+jhGJW5
         PEDdEPWec3wQvaLXef5GpQNJA+1+ZcwIfCCgpaKA3bsvi8qDlGe8qO+AOzS9Daij6JvZ
         MfvK6BxyMYZRJ35BYApXS7etlQt6z8P58hIc4uT9VQ+fudwXTPl6AAPXrQqLMcGGuCCh
         JrWu/Z7wbgio0Zcd1R/kW+qPQ3SlMo/lEu9WRmTKzVwBIN3EjhuPpAGoU/DJH04DCGJ8
         KphQGwXTkEoe6W7g3OqeBt7587JP3RXzoinXck677LcjNiruSbufW0KvWQ3ysBXwGPaY
         BcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943355; x=1763548155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lTTwfl+8zqu4m1wm1arK7XbgGiT9bQGfagDjMk+wU6o=;
        b=O8lz7EGmBg7CU2QWIKKzbWyRydCzTkGRDJ6Z66FI24rfdZLBX8Q8JmrhGRzyddxoeU
         QCkNmzdbL6MwYoD0BZJcleKlQQzk0PGk1YTAGCReYHIkZq5yHnNpZOlowSyReA+OgHfo
         BeZV9v/W6whgNP+mpDE0HR4L11F4D5Ken3NNLygcIgzExzIeURxdQEDCNXRxx1OqW0C1
         j1IWJgAA+uM1QbdqzaWXeQ31dnT/EQ4K9qpF+IDXVLiWqeQNNMpDV0sQ/ax4MpozeU/K
         85iHJX8mnDe25dMQJ5Eegz85WnsMvzXCf/sbicXd9BWAkgRIhFreyA9uLGZnLIxYKWM/
         B0qg==
X-Forwarded-Encrypted: i=1; AJvYcCVmpCPG0/flcDENSBJ3/N1HmNvxj81aZhPp0x22njvlUJqzTyNrt2e6727sy0CXTkgEoHuh86TsKzMziQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKYPz1wEb/wvAIAOle3LV1JpAuKqO0/krQMesDUhkPHvyGlxkx
	Q01DCDeUSHkMaf8mE7etCIv/NnkMFiqb9W++ehjrHl761rgEkyC2OXLA/pRAC6VyPb4=
X-Gm-Gg: ASbGncv5U9dddU1N4NI6BXYRp/BgN47OLfle0ZzFJQWvk6XhdoGzOP8nZeQbo5TwNHL
	kzMl1jWoipXX7IcqsAtDMp4icDnAlzjVxBsM4KkjMyED7deUAMlqvuaCzazINjaVud6lWE1pAoZ
	/r4smInQT0OaiIglfsKPiTkeRLhtZLOy1+uYOnUHrvaK2FvrkCXbEocfVDAAI7ewWzZfXkUkDNI
	s2huR1kyfq1JILg+2Znm0r5NW5X5XADNBx5SvsH9mUX/Z4k2J0XAMU0bKoZP3wCZsSsq963iDQM
	5gMv8rg4Z85/PMIi5JibUCxNc50xu3Z1+VWCFrQKGNfShAUDGHDngTsL1hjafAh1bLVpZHTAbkv
	Rj2r0R5xR4cmHGE3yQqiLm7u9n4YMVXHmNJMDXTHwrRtOMGkC9yEWqOD8ddpCEahYPKhAdDycyx
	7orJm6nTuP3gpNPbuf
X-Google-Smtp-Source: AGHT+IGrKXMvZPgqQESuBAhxDftEhNsnWrEuywC4iLSQ8rVCnZlglSobGl6lS0FycwtWDDujVctuoA==
X-Received: by 2002:a05:600c:138f:b0:477:79a0:515 with SMTP id 5b1f17b1804b1-477871eedfemr12412855e9.8.1762943354825;
        Wed, 12 Nov 2025 02:29:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:50 +0100
Subject: [PATCH v2 05/11] cpuidle: big_little: Simplify with
 of_machine_device_match()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-5-d46b72003fd6@linaro.org>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFnyTG8g3Dv3wVreirAjpYs3pAX3qJ3UXkuT
 K35vq/FMbKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhZwAKCRDBN2bmhouD
 17JZD/981Aty8LTyqThGaZ2jPZnQRqILA4jQLUdlyGHSD3o1JOkc/OejeGBa2XG43Vs68nAkJAD
 joLQtVvcic7O5R3bHLdubIg/nwmSiJf4E3lzP/egNMDXmQGhpjFr+JbWrafzPx5AkJOcZkYqz6N
 YUgS2cJxbZYonK2umjv++lLOLQnSeIo2E+KprbWM0yjX6kUbPE4epGQaM065McRy0AIwdI4fxoW
 T6NV0F+1HAANoi65DBqfvOzIdaeldH2t1qyaOaX3hEtYzvDDKNjh/Ut1AmmH7gSnlsU7EfG0AwF
 O/P4RyK/k0twGUZr83j3MngPkzj6XIIc800HONG4zXqQcRu5Wl+UDmvPMfhu+G8hCTlD7pTKc7B
 3yRo8XhIdgJZL4BIBD3ZMaD/sfeWkS5N2HQce+sfgszMJWRCRiAIdL4jq2lZ87zhxw3NaR7MQUI
 LnKOqV7KTzrZndBUoFckzLoGxG9iwlS/Q2z/F/FzJK9Wcw7CYIjpNYhIrVxg8XbNbtfnvevBGif
 fIEC9fmM1ZsBP88jyZMpC/z4Jsfhbfv33/tx+L/MkGKxM47rhKd3kvDjANqxXGKWFhO2FB6auwC
 +Cv6k4NIK1sSTmE+jFxF9lSfYVoaZadbNr4XM6w+OP766Lilq7Fe1l29ZMNe+NsXwsVo4jys4VG
 Bx3+BfE9uyjqLNA==
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

