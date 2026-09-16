Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847403B71DC
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 03:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528108; cv=none; b=UEZkZGg7y6Ta6llFl3bzbZrfWzscaHF5hi1CxQqVaW6f92Errs2XVEAIZzHECsU98c5mjbqMmy8giJkPXmr7ykMj+HaaSZs7pzjGCqBqxL+icvl0S3hj0vW60xTrGx62Ul16XjdwQPZkUGGG1vVuyplIxsVXkJ1l/+y7FDzLMQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528108; c=relaxed/simple;
	bh=DpWiD8Cfu4Ku/u5pgdm/NldUMARvs9TawVNZAjHM2lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vwthzvl8Hxic7TCDgKNuK7c+vk3byI/1o4FlKB6shxrlV/rQsltTFGCcl49cSRh0uBcBzZzPOjbM4x8LcHMo13j2x38ioe7fdHiCMNtjXsJ46wl6bbxg6U2Nti7I3NqSFJdpR7EN0r4t3RRcCqCVtZjilAt26NufTR8h3V7iiR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUD5BdAZ; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUD5BdAZ"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-7f4f0d1779dso360249a34.2
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 20:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528105; x=1790132905; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acNZzyf/OWXjg5U+vhwU7dGtHUd/8SQbsA8hrhEspe8=;
        b=XUD5BdAZF+lxN3pQvhyiw6WT1aIGiAvO63Qw6ayHxuKidUCKS1hXI2ikhjSsOvV1GL
         yolyF6PTOdG8fVTMZQkWinMEHpXtvwUf/RMLLOw9n6QvHnGrCJqKQioiL6JTyz8Z8yMG
         kjY3VIAn6QnmtFNmtPHtCyd4KDYVDq5SXN8fmJmhqyWinGgO0ROck7bsB594KVpMgyBT
         3dj0l3dYSYFsqls8y+2OfYayp9pSwd6yA0//KfPv6ECDhSSqKaSwmDvTUAsw27giBar1
         Jf73Ujg+o+CbHp9PrbnCQ2zzRjgL2SWJK67doMmVedN1zfud/c7Vf0rOseSQYC/16WrH
         DaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528105; x=1790132905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acNZzyf/OWXjg5U+vhwU7dGtHUd/8SQbsA8hrhEspe8=;
        b=HiCW8EncmXTpFEX3OK2lUole2zd/5HhhGK0xpk+2kKu/9E3PsXPm9irIAwGlvlX5Fw
         NbqShE2HLu/QIqH0Rrfs8kocJSOl+6uV+ydKLmQXCclm9ICxwgraZO1bf/imxBvLaXlC
         FbLj0rOUrKqFydeNMiviPIG66KxdwwZd7Wa7+9ZHDplFI3RgPA64Qh7KxPywNidsf1jY
         pKpsNuXhOlGO6NsM6MJXjvWBVDMj0RcyzUcFPlauU8PoY6BdGYE+UrydJH94YZwfE0pz
         JyL2+LZdrO8oPe59oAGCjC2DhG8Dc5f99cecMTZXBDvDSY1CnEBZuGrduoPrzzMDSWEg
         5fkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtyn9f8l0VemzpYWiu+qPxgtFQOEfSc6UbTLFWB+h81Fda/y5ebo8xo2tcefL8wslBruHW4ZbWkliujA==@lists.linux.dev
X-Gm-Message-State: AFuF++lt+6nJqehKDgWNZCCpXWtdd3WJkeejD9dmGyv+kCMMPw8Vzuu9
	yr+zIgMYElPlJ8qHWunXgEc4z2uIoeeh1buC7R4ocyiHCIosZbAyhnaj
X-Gm-Gg: AYBFou3tqg9xNPhUjSuLTEXqup0A7URzLbfjdngcKaDBulmL1LJVQaj1LTvpVzqdOhM
	fMIR6lhEbq9zpp0BS/YHKoDGA24WDTyBbqKvgGl3lmDF91ZxuQ1XSwEYPq+iW6xlZJxMeLXOZMm
	AkfKuZvHAokxbQ2Jqx2xvJG/DYOpkw0p/kJoS0XrJLrwFxbatYFsGtYCwdQlZU9v4UGdBetruv6
	m51vgHekvrUArVgbUAnbl+nvkoD5QIFweNp17rZXmrudAIsyWBDYqXIeE7nBcU3+nktlQkJ6FcO
	dzDPjDZ9SxXmCINwy7V+YEnIbAjUaZ7/14ADvSElubLlLLqOcvHC+t+/rpTOKJN5jfd3Kh8DmlU
	C8/qDDU4BWjDQPaq5SeRfC0//lRZLAx96CksujEsrWJgWNURQwPC4lQm6vOWRn7pnqRmOs6BFnJ
	vcPUNYjw3XMNGQL1q4MoFBPnNN7kOMQEt4ZjkM3o5o+mN6xJcTb7hVxzpinCaoiLUttirapOS55
	8W6hTyyHuDbHTgtzSUp0/72rzE+kfrUZ3stO9Fe9mXLCVKbwklkap9GVxYB54nV4K5OOpN2AgWi
	6RwGA+OXRdZNENHMLDhlwx73KwvqFnVMIQfgEbVbBvec0qhEIETh6c8Z5LPgpMJvyLnG60fvY21
	UcdUJN/9duVxtXkKva3k2xXA=
X-Received: by 2002:a05:6820:188e:b0:6b3:f4b8:bb86 with SMTP id 006d021491bc7-6c7d1bc852cmr1139016eaf.22.1789528105201;
        Tue, 15 Sep 2026 20:08:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c7a677b3bdsm1718078eaf.6.2026.09.15.20.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:08:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 21:07:40 -0600
Subject: [PATCH net-next v2 1/2] dt-bindings: net: allwinner: add H616
 EMAC1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-submit-h616-emac1-v1-v2-1-322b32e40eb9@gmail.com>
References: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 13 +++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml       |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..2cae0133b3cd 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -21,6 +21,7 @@ select:
           - allwinner,sun8i-r40-gmac
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
+          - allwinner,sun50i-h616-emac1
           - allwinner,sun55i-a523-gmac200
   required:
     - compatible
@@ -33,6 +34,7 @@ properties:
       - const: allwinner,sun8i-r40-gmac
       - const: allwinner,sun8i-v3s-emac
       - const: allwinner,sun50i-a64-emac
+      - const: allwinner,sun50i-h616-emac1
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
@@ -91,6 +93,17 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        phy-mode:
+          const: rmii
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2ed4564ae99d..b20149c3e850 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -57,6 +57,7 @@ properties:
         - allwinner,sun8i-r40-gmac
         - allwinner,sun8i-v3s-emac
         - allwinner,sun50i-a64-emac
+        - allwinner,sun50i-h616-emac1
         - amlogic,meson6-dwmac
         - amlogic,meson8b-dwmac
         - amlogic,meson8m2-dwmac
@@ -623,6 +624,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0

