Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD602EEE7C
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Aug 2026 02:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712048; cv=none; b=PHZtEWZDfFFpR12kMU/ZmRjmY9keGXJhoKMArveISWoe1j13jjmHKcLiFQBNVOWB02FGOZRuSlDxZrE2ZweztQ7qyGjgEwZIgs5Dtd9OsnTBiGBUsg9DisuOjvlsnGj1LIDrHrkSZJ+VgmKqWpqsnHY51wbEXuuvOr4zgBzh+1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712048; c=relaxed/simple;
	bh=xXHRUhCMZY1UP0UimNCUgmYKZUE5pAtrJ+aeGai+WZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c0x0lyX/aVmb7HBneXes5ppfbkgP9ZUHiao8bLtMTeaxClKauGQizugXqXMAGr9tCC1Tc1Fnxr1zMOngSyxvuMz8bYa8a9FIUEO7yHAuw/mhJQHugac+zNU/9p7BHC7te0TDQUpNRorVU/IW1M63Y3vCAKn5Wu8/ZV2twn1BSb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbNXufER; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbNXufER"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81f36179d72so6288647b3.2
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 19:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712044; x=1788316844; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=qbNXufERLaH6xupQ5TrMN/CO4hPhLPIiD4DpRbKcfJvOTrGgrySJNaPBi2oD/Va/fR
         YtrsL12NAtKJmmdJmz+Y20l3F60lfl21W+Y/krQnzHQIls1qvsY2/fkYqL4qvUulDbQp
         rEM4g+x5VfsK7QTC8nC6svyC6o6BUW44qVKiY7sheFAXpZ2N5umwAOltgMfdUhgD+ZU0
         /3w48BPKieAKl7lTs0qkNJofTy6TAhCw+IiZ3m5/qYVWgu2lidCYgk2BZOB7MK11zSso
         CTn/bk0mR/Bq0K3Tlc6DjgK1CKXpewrvqR5D6ZV+NYrycbH02Dk+5/hKO6hEm/M3TSJh
         SkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712044; x=1788316844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=X/9v7HhDr/o3ez5jJNSpipvSdOeu/yCZ0P2WzmqvKEFovkFGU6rv78kPYCKKAIp3bC
         XWqfFO1nFjrW0R548upjHfD5Wonx8VAkDCohfrkK3/k45yhMmuL7JICNzTXLd6FnGBCO
         R51K019F8eShvZxWXZAM5o6DHMmn4xNtZR0heH1Pv/zOPtqk6/dfL1p/sNIW0RJGIjaz
         pJ+ow2zoAr8LA7d2tCpWc/UabrXE6H2j9ZcVz6opfgGnFVuopFxWl1OChAJTPyK8U0Iq
         UifnXJCyS8O0IuqzGIaYShCpx12r/LgpIkKNgcAtFa+f2af5xD3RDEvPLGKksO9q18Kq
         EmpA==
X-Forwarded-Encrypted: i=1; AHgh+Rqvxnb0RHQi9VloYGZTVBlHkD5mHRNVmlLpSREdS8uYIg2WGLp0cDrtND3pQCpr73ZqoAf/EmrQ7D35xQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kiKs2ytAcduKTZ7LXoOtD/hPV/N6BV+MYtbrjvs0tK10g8ioYT
	ULXGRaVZ/8efubVZzLvQt94Upi7ZQtfQAjQCRBDBESdO+UBk8pT5Cvut4dOjpT7f
X-Gm-Gg: AR+sD10UIwUuX+CFgs0cX7IsSQXuxszXZSTMoxgxSO2yiGWWO2EMfKohM7bGv/pje90
	aaqAaW8G3usq+gjX57Me+ipPBSx9RASZL8TQMM7LCvcnUOH5sM3RjT9FAJI9xVywwVmfBJ5HWyo
	WuwndfiyuNaVymF48YcIprFqqdgMdev6ZkcbLYdaPtOYBZy9edVcQZoYdB/FKoOxJTuMD3S6Rwn
	U9aSX8g0VQTWKe8mKT+7QB7bwybOKZO2cnxf34eOgz1s/Iy7EMpp0l14PRLflZBQLGqC4WYDBhj
	gj0L4fCOISuim74QIDsj6vDhpvEBOptDcK1Yims/twsCXIZDiTKoWbCeNglBgPe2pYZM2pib/OX
	j89V91HCXtY3+TbvMW31O72vowf/PV65eEMzV0SF6r4vlSMd6PbFfOHziSuFxH49wTqKXcwQKLo
	JFRpTKu5REGo++vs2wOxW956OGIM4yIWT/Zv7ZO2JVwpfZsOac6SHRSXcLFdih9g==
X-Received: by 2002:a05:690c:c3ce:b0:845:ddf4:a39e with SMTP id 00721157ae682-85740497985mr13245667b3.30.1787712044566;
        Tue, 25 Aug 2026 19:40:44 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:44 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 02:40:30 +0000
Subject: [PATCH v5 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v5-4-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0

Add `allwinner,sun60i-a733-dma` to the list of compatible strings for the
`sun50i-a64-dma` dtbinding documentation.

While the A733 DMA controller shares many similarities with the sun50i-a64
DMA controller, it requires a specific configuration due to differences in:
- Interrupt register layout and mapping.
- Number of channels per interrupt register.
- Support for higher (32G) address widths in LLI parameters.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
index c3e14eb6cfff..1cc3304b7414 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
@@ -25,6 +25,7 @@ properties:
           - allwinner,sun50i-a64-dma
           - allwinner,sun50i-a100-dma
           - allwinner,sun50i-h6-dma
+          - allwinner,sun60i-a733-dma
       - items:
           - const: allwinner,sun8i-r40-dma
           - const: allwinner,sun50i-a64-dma
@@ -70,6 +71,7 @@ if:
           - allwinner,sun20i-d1-dma
           - allwinner,sun50i-a100-dma
           - allwinner,sun50i-h6-dma
+          - allwinner,sun60i-a733-dma
 
 then:
   properties:

-- 
2.55.0

