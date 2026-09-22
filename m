Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDA2223328
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 00:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035614; cv=none; b=A4qrcLzHt+Kqa1paulYbwIeMEVa88BtejCboRUUZp35c4da9YapEZDNxzI20o/OB2e2zChD12c5fOzw0GdFw3UwyRQUwHHRnRtdsdI66JR5x5m1oZ7wXX1BagrJqnrt24yBQ1JP8pmP+nslUN0m49l7mU48G31cM8m5P5OLpTj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035614; c=relaxed/simple;
	bh=OJS6mQlRWmTTimOyj6kC0TvQSBszoDm45iW9XPqV2AQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H8vR0l9LQniyc8GajDfR9CkzOS9/uh6Y2K601f0qVqmcuw0PPfbLSezOON3A57c7K9sz7JxfnwfOVX8daqQ0r5AEw2wFVliDh1d26T8NnhcU1C5Fg9qMyo/I/VYRCa+/IXrcGUpGXQZj6DrjPE8p1YP16/AK9TJmUZA76PV5L+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sOjOhvaT; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOjOhvaT"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccdd7695so1244124fac.1
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 17:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035611; x=1790640411; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=sOjOhvaTxiGEBKVvSJxcZikHVm2YvMItUrcTLs69AHz/9V/N9NUfxPfqKhYm0R7he2
         D5MpaFqZYDRC40611IwDWf+A+eO3+pMO519lPvd5zr2fOgWe60BAq4ilUZfavSbU8aUq
         SWEX67OBlffhuSyqifl3ujjYLFcJd6byyWclzjmOBTr6iFR92MkFPPeb/sCsUrwuaTcs
         5M23jF3xK5zYnHrzQ2d5fthHv/9DYBhQTsR21rgpqU3oPLQG5GE14pAJerz3y9uKGWB+
         JxO127Ovu/Os5Y4o1yCu4Y5577R24EsOw46xonKgta8Ujy17FGWCFwWj58oXhof6t3Vy
         Rvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035611; x=1790640411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=ZdW3stOFBcTbDzVIfg4oCLcA02HuvFQbtSVy6R9gvXHc1e9duNRgaMoMC6auU7Kacc
         JfPCbVxbSWvNzaZldKTGCmeuZdOUSkjJncqNilDEOFDS9/O2EwCtAlo81epeP4L5egSG
         jekd5SHcoCTRrZqGWmOsSulkvSgwkVo47bsC2qW1nEznFU1+xwglOsqrvtgtnjtINOln
         sOAfUuDW+zecwlk7bzn55bsEjgFaAfp3UJocClCCrHDKsKSn2EadrvuLX3v5J+iO4imH
         sF9vnjJQEKjD3aFo3H8/Gxzw2iMfAIKLo76Nf9183wcKD0Ud7XkENT/yelZQVznAyjnM
         uk4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwelqpPejilXsGjTA0IZNz1lPsnmNbFxye+WFTdxT4+eaOix8wk32MwVXkgmIPOz+TjdpcZjKIsmJvqmg==@lists.linux.dev
X-Gm-Message-State: AFuF++nX/2nFiiv284/GZvTFbVYTbfGKmouZsswWC4Y1XdR1JKDQX9nH
	HeWBE/GSSNgxLhlxr1VwPz8jiHNnC6p0P2AI+5sGO05TnEJwm5nS7A8B
X-Gm-Gg: AYBFou0PTk7jMFU2mMcyqOwIiBqIUhdtbMYVgLlvmh9wPDrLH33/TrtQMmAsMFIKftp
	BCjsGfcy2S+CtO1ryKp9uHNr6p8JRmn7AltkPHrWai70k8RIgauvSyr7YLxdQpSkigvAoH9UNvf
	nZ+h6W2auYRoUa3u6JmQ6MZqWFYrpYmR9FrVq3VlZ2ggJpci/TZVtLBTa4W5TH5otAGx5KH2XOR
	VrxwbZqaknTE60m1iK/xnXqorzuU0K9Mw/3IvxwtAM5ACSYDYJ2pHt2a4611uoL49zuy8zEtkzv
	CFMNxNMzZw6zoidXY38jUTuNuHDCvfDbVV/AmidJFkAl7XC0wNq31PWSxtLhFtJMT24GpNKTNR4
	oqa7QrXPVqyaHLLWXIntCKmtIBcjnIJfbzhyrOixpkILoiJ7SXYGkNdIr/EuXza3A276znVYt24
	jb1at2hAeOmwEVExTyCfei8IeBcGyFS5TYMzesC9fnC9NjTmM88nwOLCOAXwMOpTVeeEe9FIOKZ
	JE+gntsoOUwlIQAEaGbZ7UPi/jkUoyzoyHLIIh/jGb5lxGL3vJHJ0u+eDH4252v/bbGkkaTJUu1
	Fxz6LD/DmAomnzjSprS4zLPHoqAENEGT7M3mhXa2m+s4Io/Hw1ezLrny+DXs5AfYRDZqMRaxDWG
	HuE53+zQS/yD2On0BJIZj
X-Received: by 2002:a05:6870:e24a:b0:483:d19f:334b with SMTP id 586e51a60fabf-486e6eeddb5mr12235098fac.24.1790035610897;
        Mon, 21 Sep 2026 17:06:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48f7280cf14sm801683fac.13.2026.09.21.17.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:06:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:06:34 -0600
Subject: [PATCH v9 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-h616-pwm-v8-v9-5-37bec6201ff5@gmail.com>
References: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
In-Reply-To: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..d9713b1044c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -918,6 +918,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0

