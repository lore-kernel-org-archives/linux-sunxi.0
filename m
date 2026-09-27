Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FAD394464
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521957; cv=none; b=VkryD3lXpgMhX5yNuaqT5TCZ3Ki5pDPEAZlOeT3/2naX2NE7FNFwSymNjZBmZekjFPhNzMrkbMbFnnMv+yDxdIL3MI+1oQPeppPju8KkYn6bEcGPy8h1h2phtxsnGKIL9XIUwU21fhOk3dQlY3KbHErvvL2XIiDf3ODwze/c95s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521957; c=relaxed/simple;
	bh=HqfZG9G5ZIenBJJAaY9rfjLXNR0FjaP1nUhMOUSdumE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UT4iTwnf5p/MY9yewydmW8YjI9Bx+v/1MlR2xtJ13jjxaNylBk/RFOXSxhqZzUkHxK1Ig+ImuOvjBE3Nt+eudDEl+1hpP1SC0H7yGkWi21tpvS8PYu6LzVLXFX3coOyBpzIXp+Z7hbYxagymd0cSuAjudHWHGnK7ggZrzBkHvSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cavDKUkf; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cavDKUkf"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b926f0so1140561f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 08:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521954; x=1791126754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=;
        b=cavDKUkf5dzhn2U8pXNjbRjNAqck5HfudQHfkmAicE14pETv37w9f+vx/HtfJJ0RQf
         5bQbG/LmuzMUSwEhvfpzkIB+nKRUYg8J9fJLiCu4qAJy0rR4XJnrC84paOWNkttnDlvo
         IfRi9yB3FlnndKh87FbayuTKdnTF0kiY4QX/8OSfwrqDY/VELj72AWSAsOAn3k+i8KXz
         0U0n33qQHmpTI2PrcCqxtEI5/ZCatEDOhvxs6mxqlK4G276RN6uxYL0qDWs7RdFJtmu/
         DSGVuH1yUTO1418P+el8fMWrGFXtTLsDlWKbKtkEgyxgfihzLFj11ibB+yTHZBWbShSD
         HXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521954; x=1791126754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=;
        b=t8P+PVZ2UILBLX2a/UBI+9ypz8a5xzWL0wOQpYrlUVm2ankjjBQpn7029CJotfYyGD
         1K8liOPxAGHK11OUsiwcoBMHkdkC2Bm90G/3wVoSoMRqdmiHKFe9p/GOlevLjohY9cVe
         6T+3/G94lwWBGLFe/LxOsAynjdYeuaGqJcYYXPBfzcPzn8t34MFRyAjiRr8WXVj/fk3f
         njH6cLBlilZ6h5kVKptuMfaw9TbfYdoGr2/1HDTSTPK1SaAiQkhLcAYG1OkRtsVecWED
         zNjTU+VA0EawGm8FIlSu2iJRsR8fNy6jUqnNHB/VaqT9P/ptwDyGj39uc3Ut9vil2fs9
         u0yA==
X-Forwarded-Encrypted: i=1; AKwUvBwdQNzz0s04SsDQu0i10gaRc/WZiJGp/CDurks8xieTMtKGvqhM4/HDl/KbL6ZkzMnGLWcxlqlCl/tSIA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKKRVJR8udB7xMlVqawalC71WYoTvZbQwhts8opP99f+TwnBP2M
	d+kH+24nq3SZ2Hfc4kpYC5HIZkcQJMtDumYY7rGHfoxZcBr8qzLQAzZ6
X-Gm-Gg: AYBFou2kVSmaxy7wjU4ABSzu9Wl002PYcS05fMyqhhrhhYPYA5Fn0HWTPE48RJgr+cX
	tfd1yU0SZdXApXSQaN6tTxVhXHi5SKPV+sE5bLLuX1Vh7/dyJWxLZqFc0gtrzB/AWH0GmHqdpyY
	rqmPoxz2aAceJSNSzY/djRol3r3qQMnW9ZT1LunfwB7CCyziTftqmW9tf14aECcX8AHP6wbJAtp
	tuTwO/t4u6wNIQvZFxTPpKLj4gLLXwmYABIwnZI3xVshWiggM88MNT5H848yir7tgPXgZH9ienP
	+HUw9dJ0WIqwXtBUfCMkwdgkBvzXlea3LPZJnUwycBV4jeH3H9JeyXQH/WE0Rb2IkAlLsG2Coas
	7dmLTxA6aQtnRWK8uP0cmX8i0i1EAFpakvtGsS2gBiYQKPq3RmlboU8IEooqhOazJVgYqGGX6WD
	pINqyP/fhMaECwyq6HAxDiuInRxovbTnj5NShIEQvnMDAADxNihLu0wkK3UoWWTNDnDXrG9Mwgt
	08M8s677zcB4Kgi+ciN97ozqpc27E1c
X-Received: by 2002:a05:6000:1a8a:b0:485:8cc8:1f5f with SMTP id ffacd0b85a97d-4887187595emr20616765f8f.42.1790521954539;
        Sun, 27 Sep 2026 08:12:34 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:33 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 09/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Sun, 27 Sep 2026 16:10:14 +0100
Message-ID: <20260927151016.186493-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index bb9273ec2457..179e7842bf46 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun55i-a523-nmi
       - items:
           - enum:
+              - allwinner,sun8i-b288-nmi
               - allwinner,sun8i-v3s-nmi
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
-- 
2.53.0

