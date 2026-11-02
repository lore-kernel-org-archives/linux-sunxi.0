Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649329;
	b=OyGgXN1vFq67WUEiNOgPlDSBT1B1JdGxX+ZVBEu4K2y+LXGMz3qNWzVlEVU2CLuHc60H
	 OGeyu3JLyXoNWclFfBP3Ffu0RBrT4heBuSzx+8Ofeft62jGXUQjhxtuwcpg5DewJap4GO
	 KHdv5HQQg6Ob2rln26sVBC2A30DCJyE6kJ4NLAfffW0rm9wfqqC+ujYGICPiYM0PqzWT0
	 o3z7w+hCXzg27Hh5PSlMw0VmYOOyhxc9x9dRLTnwz4TeLeVZCGyMvdzgwVFGei2N+3PWT
	 a6J/CYRt4VnVSK1Pc2z3lb8Mr+rD+0mZPp6fPQppAUWgBwyWVWw4cwi70TIB86RyIIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=oeaxEAGyfTWmv/Hg1/uI1jVL7g2PUTN89wZ/0wZ/FIg3hEE9c/qwuFMBjYrIRAGOAzM+
	 IzDDBPqfnWwsZFLxmg9x6lRCZa7dweITblqglYGrGfsg2+8VSV4mBxLHW2fuZ/yveTYFi
	 Y0rbYBE+/UMInFLzqzL7tELuOROBKmKkQv1dnMgNoxIx9tCyDrXS83I0z81IaXp6xe4gn
	 8XOasOSehnsH4FpDRyB1/pCpI3HZFXvVd9ILeXarXRcOoQlIvcbH1G2gaJ09DP5ZiYspn
	 qDXiijiAUDd6ma0AQ0uuzXNRI8I2x6e00Wfhmlwg34d1Hl+297DWgkqYzxlREJehR7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpeHMOZz;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB75606EEB2
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 19:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EB75606EEB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpeHMOZz
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-483c607ccb4so2025755fac.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 11:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649328; x=1794254128; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=rpeHMOZzgAcVHs0RB1gfkB7BTRk6iy2mbeTygZ61H2EG3TRVfYJO6ze99+qqwOOFzD
         pNvGB0ImVyrgkCwzy77dC0nRcEge3nU7uOYVCD7AhSJb0F4Lzk8mSp2QAQKhBxSBUUSd
         Xe1oX3SLqrFMGs3nfMTG2Zf01o/Q2bKtfq+OwtVzKz7b2S/3EuwLC7d8FXFpQTZalmRc
         VyO7uCxPPKA/4E8GE2C96pE0KxOnftw9WifGuVuSjxcwmt+LyT+9gCpvM+GdGQPOsJDF
         9/LUmrqbHSQ57jVKmNa9TzIJD5sZZSAJfHDSwft+/Hk0s5DzvbOWKWOibyhA/u18whTb
         guoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649328; x=1794254128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=0QpihTSurz6wGEBMfi+hGBc0uwdcaKL67Y2ZG+V5OqFxOzRf34RNKGe0pWjlWBTYJy
         dqivcqUgMYEBBDDWnJ3mZymYvQ8aAeC4l16JkZzMqp7aMXaZ1EmO/twis9KNdVokIw4y
         DdlUlvA7n2IBHDlvZ4R74uwYu5Q7EH+TEEa8U1A1je62Be+C5NB9TrGCm49tdNQn3pWB
         xBhMuBFRBoPt1pBXP33v2F5ruhXHwlw19JPgKtbTsytSx/54gg9NuZ4t15ij6LfErE73
         PeG561lNUrJ+HmpUBb4JGzKTYl4l8Jkn/OgIrogXcRAKehpx7nOqilpl5hc9jVhs5NEb
         tOkA==
X-Forwarded-Encrypted: i=1; AKwUvBwRCjW7Q3hilyuGIMjXQ6Bh1x6xZlJq0fyFZ0JGH9YG1QI+0x49Hx4TXtsOr2CncrFklO3C8L9Jd9Sh9A==@lists.linux.dev
X-Gm-Message-State: APuU4Z8G93f0sgOpWuoyBsHXLeevEzHG5HfaBXtngxzU8NEFcfvtfSlT
	OofF7VBqaHtPWra3D2NdinWGUhGhJKYjRcpT2Ul14NKkhVj0ap6DBx88
X-Gm-Gg: AYBFou2lpA3I4rSQUBU4EUdzz6QKGPU3FWbdzolDDes0HgQTKmAAORFJCMj5FpU0O3F
	EONXNZMXT/1SwfrIOS6mxCltK08vVbWJFoKrHVsvH9jInF1Yx5f7U3vQE8LZIL0Oxr/fLnozUf1
	+GmrBJkeWfLCDbxsBxILXAdbz1rJMIlfgQfrYiL9CBkV+gjPyAMvCZ8JaaFXTRTf/yEo0ERidhw
	OG3/L5+iZEI3GDXgkuTnJMuAkZLqJdYJoh4L+cMP4qo4Gs7Iitp+tKGZoSZza4YL6ykjnROg1Et
	s5TwgDzWGp/3+35T0OSULdsI+wQqQuMqUAfzKQBAR4D9lQlipoCau1YZ1I0gS+99sPtI87cUybN
	+ahprwA9kEOOdkuKneI8jgD4DD7KyX0pkNP/GCRWQ6iK30bX3dM0uFT24ftHBHRybkDfwhMusg8
	XwfIayLXcQA1GWLzdW0/mSmBhDxt9gNv4WLe9+7mikflPlnHIO2gMVOp+onGSFFAJWNe/EMkNlb
	d+OPoExQUrwKch8Mz+4geXMTzZ/As+YWeK79Ymr96cHMWoRSkN0C1g00RjmdyrCfJoZzsGz2nMt
	OwowNQSDb/+zuAJuzajV2fRLa73DhpxLGXc4BRoo9tTF5QdQtThTohg0zHAYwyxenrcp+Nnv3Y1
	TuDrM+b4cuJJfCQVv+K1F/T4PgzWu6ec8pAysqHwfNhGRXIIR5BbabILTrD4vGFKO5GFCSz8sKR
	X1KXNmsceeuMNZvMXiOMEz8/zfNqLuCmOpbr8ZGEgT6X82tAGCt+Y=
X-Received: by 2002:a05:6871:580e:b0:475:e2e9:4f4a with SMTP id 586e51a60fabf-4a9076b7508mr7711963fac.24.1793649328190;
        Mon, 02 Nov 2026 11:55:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:18 -0700
Subject: [PATCH v6 3/8] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-3-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible to identify this fixed configuration, retaining
snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..fc1289073241 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

