Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294634;
	b=Cv3xPYOWg+o6U4Lc/QQVZav2Q1IQl+B4yE//2bPMfZ3Poz4fP/qCj/XVOFqYFOm7dGK+
	 sLCxNyCC4SWJ0L0zoTTWLNGR5NvpGNOhQkibzyQNRR9ex6dfRwE2m36iwlZm7lgocMjat
	 xzAYOKET3VTMBqhQ65IWYCHA/uziAyCOw8q4qeHLDk/tv570HuF+7dSdxwHOIdTjAsmGs
	 ySnWchl/aV0+B40hOCzRscgFLvUU6NA1PWR4xk1+c0HF8eZYDWWbuOr1FT38QMUi3VC00
	 wulsDPwpBqjHiASSFr3NYqTBOIEpYzXHS5BT9kPO6fR8KBOQZNqncKKaHnd7v4r3bcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tY6q0/ZAtlO7c/3kJ3SDz18C60kPr8B6rEIMfU8K4HE=;
	b=BY57NLpWs1xafU39HnRANl807rJEJJlsLSFXw3IXGmETiBDOy10nHz++CB+maGmy55SI
	 fa3GpiwTkvEs3/whWVGopKbAE9H5XjvrHTeTk3MKm/6WW+hHM4S0+Cg+1GxZ3Z3Mv8U8R
	 ymYCfLBTNJAOPvuRdRMZeL4BVsHkIpBzpkIGoyJ7gONjmHbsaBIf1Swi1V4NQsfnZbK7h
	 UHhBslSESA3MxXrdWQ2rDm1UhmPI1KZgHoxgJqaNIW6ZUCwtEhWqCd7ZQa2p39jJLXdwg
	 Rtis49CkRdnVoBRQccn1F/liLtZp25reQVJ7apagiYXy8EVTu+bZR4Jyfz8CxcZWLOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YX1mbO2p;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFAD606A31A
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 17:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFAD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YX1mbO2p
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso623159241.2
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 10:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294633; x=1793899433; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tY6q0/ZAtlO7c/3kJ3SDz18C60kPr8B6rEIMfU8K4HE=;
        b=YX1mbO2pwBXXuWORwswzCih06SDTtus6+aYTF84/nkbtwU4IBP7DYHl/u06BlHMMnA
         PtfwEN31Ty6ptLv+TmPlmrAdqOZKY/D+pA8/Es4QdnTtH9BUb4HJ3US9LeGCgVgWGmnn
         XnyK5kLlQ/J9WChbyRE3Ix/ebZfSe/UieBxWUJI22OTZrG/JbxCz8VN/jbN4OMWbZhb0
         4P/mS43rdZ78C/SXuAqOPGIswDxHe8Dv42XettQhY+dv11lynLEX8d6ea/eRbNqKXA7p
         7RcMnb9A05Gr/kcQPOHQPmqRd15KWNxHR+8JHZVVjIemZlJumofeP+DEIy5FRWfffgl3
         kT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294633; x=1793899433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tY6q0/ZAtlO7c/3kJ3SDz18C60kPr8B6rEIMfU8K4HE=;
        b=AEFQS4/opK4uFhjWYq0JOeqYZy7GI4OufvoiSD8aG4456GsVKbF34iuxlkTEpu9mz1
         8CG4ZBIgIipJ68W/9j3+c414fqDP1N3VgnbRg/JX8nzE9P+x4izqlIBF9JrddHZR3BLh
         9DHrL68W0VXzIRCE7seo43Vyn2wNbPxDrBIS+TUvW5XSdpiIxY22iNQiQTNHTTOI0gOx
         D+U0MVL/OcKzGOaUt6Cf7AH6ryFxfm6TrEskd9VWnXngstF223Oj9S33DezIorZshtYV
         TSbYs/m5u9uI259qK65Jo3LsxBbVss47mMCyk5Fjd8IfxE0LYFkQdcHYU4z+uTRyUyMd
         sWjw==
X-Forwarded-Encrypted: i=1; AKwUvBxcIk5pfUs29eOiLazl7HQKJ5b4OH6nYloroycM3zDzuFE4DSeRxWdrz0mQkIHeZMKyHGHwjB//JXYnOA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJEDwkbQX1yFiZNsJJ1XBZR71oXRD8hepz/i8+Cdy1HP4/vCwRi
	Dj2xhzeM6ljHAb2JrzzfO6GOoHBEOOL0jLVGm6rYdyrlDS5LnSQOx6u8
X-Gm-Gg: AYBFou39jlZMocnwra/fvHxHQb38KNT80Y1a51rirPbYgAQ3+WqqrAJDSP6u8vL6yuT
	qHcP21vtUTqCk1Ku2av7BqQQG5bVZdg4C+Mt3lFw+Uopphfz5/wA2/0YNX0zwpvhPhisFjyjHCd
	4D+kv6uMTtblErX7tv7tkU5AvnWAHYvtfRbNDANiNsYMt88a7KUnb5oCXVR4cuOErevx19Uz7Cp
	KRGsv9O7xr6W+Gm7oI4BERmS4HJn/vbecHMWBykq72wQ7AtycaeQPNLbcOj3Jx+n1ZXPg74/xIu
	9M4ZEQk27JFJUGX78eBHjB7CpgWLQIfiLDM6lp5f+/Xi+9ipkNVkfWAB9w86utSuUD94Rx2saAq
	YiHWXgoDXphdVNYmeVTkJGjVVvPjCK+EpC4sA1CDuBP2qqdBzyWJsYlgsR3SkTO+NhtO2spf09z
	ydjv4irjIkemxOJgQIbdLe4zLDq2l5213kDnxaW1YsDbtz77aGPwHwiItugMNMebtbd2sr5zKfu
	bYA4a0B6kIeMczLeRiHCcfT2y6UHwmT5klDho7+dJzlQWMNQcZOf5E4EVOSIU5lO5gg/ikcrzO0
	q28ywTNh7KL1sbP17oiWW9rqJP1i9t+iVO+kNWXK8ChZHEuluvMuzMM52LHX1AtWaFl8bV3I691
	jcTmEPgSGzAVW9iZHHsUpZwedD76WXIU9nr1j
X-Received: by 2002:a05:6102:1626:b0:7cc:2bb7:131d with SMTP id ada2fe7eead31-7d03a4eabe3mr2727809137.9.1793294633099;
        Thu, 29 Oct 2026 10:23:53 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d32a48sm9907357137.9.2026.10.29.10.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:23:52 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
Date: Thu, 29 Oct 2026 14:23:24 -0300
Message-ID: <20261029172325.3425046-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB 2.0 PHY in the Allwinner A733 works with the D1 settings of
the sun4i-usb driver. Add its compatible with the D1 fallback, as was
done for the A523.

It gets its own compatible because the driver has to clear SIDDQ
before releasing the PHY reset on this SoC.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index 580c3296a18d..da4ad6fb3531 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -23,6 +23,7 @@ properties:
           - enum:
               - allwinner,sun50i-a100-usb-phy
               - allwinner,sun55i-a523-usb-phy
+              - allwinner,sun60i-a733-usb-phy
           - const: allwinner,sun20i-d1-usb-phy
 
   reg:
-- 
2.43.0

