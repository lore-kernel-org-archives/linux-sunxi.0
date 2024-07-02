Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8D01CCCD0
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jul 2024 19:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719949000; cv=none; b=KEyHr0lIl5rOjaO93zVjZoBZRBLxGg7UxM4atKOcVa7wOt4hhGNKxjO3WJEwo2E4DJvnSAFkOF1/BH8TCh170kLLcfBvzKEelJ9WmLYHScKhtf1iSAXJJDLepbnbLt5WkVqVlcSDUq7NVaAD09IJOl4dvPPAwM9pgiI8mPbVNNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719949000; c=relaxed/simple;
	bh=yyfM9BV5RftHxEzg8j+tfyKrY8B/22YWAHLBWaIAPQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oiDdwvQ3y4shNd3erjMDtN1MzMDNOr3PwW43xLstlpaUQ4HFekO6yZjpoO/e0BLUG88jxS/6ZBm/N9KJ7bnb0aCmraHfLAiGwLGHI/S02g4fmP0qQVi10+sTUtw1TNxhM7TQ44GNabIKOCs4to4EZ/CdhetquM+0DiA9coCbaHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kj1HsJ3Y; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kj1HsJ3Y"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3d55c0fadd2so2873416b6e.3
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jul 2024 12:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719948998; x=1720553798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anbuqJOqGdROcgmaxsXeRlaGzKoRw9vLMovtlsjF9hQ=;
        b=Kj1HsJ3Y1xUyFOkbvDGjZQNlxEUkZdvHVVb82G7RCSPS072TCtcnpJyY87unYAX9ki
         2Jt6nkCZUuL5U+uWOX+c9J6VD1rBlteN3wXhsQJWWLaQyZUE513iPE+XUwVEkD1Yqjjh
         AiDMNbJJ6LA2dlS5bENz8u04/rPEBVvMC5fOBXfBWOmrQl6Gdpz4xQkJIAOSgQtI/102
         6DaRPwmnB29SJbE7TvpSK7xhTvtfmLcI24jIPeDD7Co58NVlD+QbgEVIXbQy7r3xk1OH
         JfNVtkVXRGPEAPz4ULyMwlDXbR6Y9lXLF4tSe+M7plxfO/Edj3iEMYTKS9LwUm2kZCXZ
         Y2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719948998; x=1720553798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anbuqJOqGdROcgmaxsXeRlaGzKoRw9vLMovtlsjF9hQ=;
        b=aMbZbX7gaqvbq0i/9aWOfx5BSoGB6lqofAKm7SRGB+nCKzfY8ZIBYX2TXRHhGe+7hh
         fex3dTbuV/+gu0vq/8YKZdpGmCXnFnkV+/Sub0Fu14vFSvfnJJeV8tm75pvRMYIRsQj1
         F5iyX3FXTvK9cwTKeV0StvKcEz2Oe1tiVmZIi1jdH2wUiQx7lnczahizRo6vGpKgdcfV
         PXfFtKzjhqpQgcbSEr+ZQ/Y62YAKyTtSdwcSLLoC/R1V5SdzeIcyc47FRb4NB8bNfPhM
         +jCFaJMeoapiza0tjglOK0GfvLDV52BIIKK9xN0AsRv4FL8XfI8wI6niagvClz6WuZR+
         VP8A==
X-Gm-Message-State: AOJu0YxRRo0408dOBSOGzOvjEoGEAuuM6o8Au4jZSvlwfgscLQvXkRu/
	kBJipiEKyrrXFQRBVBBq9oxpouNOFyqqKThWzGm1O4gIdJ/AMdE0NZkwrA==
X-Google-Smtp-Source: AGHT+IHAQ5EoGyfspbpWW8sxncMu4SREx+PKyvGTdRkl0DRodWiKaRVrlPxuY6DoeSlIHThJUVOT/w==
X-Received: by 2002:a05:6808:1794:b0:3d5:66ed:adc7 with SMTP id 5614622812f47-3d6b34d3bdamr11785975b6e.30.1719948997900;
        Tue, 02 Jul 2024 12:36:37 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62f83c92dsm1831335b6e.0.2024.07.02.12.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 12:36:37 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	ryan@testtoast.com,
	andre.przywara@arm.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 1/4] dt-bindings: arm: sunxi: Add Anbernic RG35XXSP
Date: Tue,  2 Jul 2024 14:34:11 -0500
Message-Id: <20240702193414.57461-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240702193414.57461-1-macroalpha82@gmail.com>
References: <20240702193414.57461-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the Anbernic RG35XXSP variant device and consolidate the Anbernic
H700 devices.

The Anbernic RG35XXSP is almost identical to the RG35XX-Plus, but in a
clamshell form-factor with an external RTC and a lid switch.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index c2a158b75e49..60b11b289535 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -61,14 +61,19 @@ properties:
           - const: anbernic,rg35xx-2024
           - const: allwinner,sun50i-h700
 
+      - description: Anbernic RG35XX H
+        items:
+          - const: anbernic,rg35xx-h
+          - const: allwinner,sun50i-h700
+
       - description: Anbernic RG35XX Plus
         items:
           - const: anbernic,rg35xx-plus
           - const: allwinner,sun50i-h700
 
-      - description: Anbernic RG35XX H
+      - description: Anbernic RG35XX SP
         items:
-          - const: anbernic,rg35xx-h
+          - const: anbernic,rg35xx-sp
           - const: allwinner,sun50i-h700
 
       - description: Amarula A64 Relic
-- 
2.34.1

