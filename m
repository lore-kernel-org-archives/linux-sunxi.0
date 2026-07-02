Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEB0312834
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 21:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783028882; cv=none; b=OnvsyXa998bbCjZkbgd1iCrtzOTc7W51Fs3pnNenBWNTyzjnvWqrqNXvD3uX5UXtHOdNJAaZ7ydqAgCP/7E76T9AFHj1FjMIr6tKiwubdv5/HVGPvmuRFoj2l+Up5Sg1zFjLHjWqf/q9wEnDwvshq5BPvCZ0Q3DU5LQICjT5sFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783028882; c=relaxed/simple;
	bh=zjILW9Q86QgNkyAX/V+hLv/MYkNtg71tImXI0XhySLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=syhMS0NfwEYXytYCzZax8b47knbCWglYvvuT0AjSdzFuC6yltLieCIMH4cpkDYO2dN5C2aa0EnLTBtdHIg8VmJEivMcz1KVFbp9CGYXOud4X+2VLQo+22Yp69yiDNJi8oT/4YZRI+1k8ClqRCDg/4Znpfsdv8YSxVouYRxiKS9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/K6XG5V; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/K6XG5V"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6649ffb1d01so3410956d50.1
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 14:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028880; x=1783633680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hvq8f3W/S8SM2hfryHlRDSpp/ikQu+f+Y5+keswTDg=;
        b=r/K6XG5V8K4D0k+4AlXIZh8quKuSV/nvGSUa2aUJle1y8EZRYnMQiuSki2dFV5amCG
         5Tkmo76eJgsWK9PFi5EgbqbWH429uiVyhESGSraYHTK5OT4lkntETKpRLtHerBcPbleB
         KQ2gwK+XqqRNjhOQ8gcHo0j24s4TJyVZqNdi8t9WtVBSF4AKJSSQEk1bVAxNLsmnDl25
         g2ufGV42tG5lbBQ8lb7woN2+jV2DFoAwIeMLGX8TykXaPLp+0lTAHRj8kLYkGSctZobA
         h68OT/e0pyvtnO6Or5mZCotdl/YdjY3DWLGzY2iQW4IEM4m5wSS9gqmzXO18PpzkSOHA
         4w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028880; x=1783633680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5hvq8f3W/S8SM2hfryHlRDSpp/ikQu+f+Y5+keswTDg=;
        b=rdFw+eUfvTm+rOfmQeP9sE+2xRBFnfAfmU2ZTa8xz+39v9z2JXWZTTEmaVdydgxev7
         +aQH4Oka8FzeSgX1JW/+lNjNCyrIdik1dgrLQKyjkisMcchZZgTZYYphfi0CtjGEGxuL
         Eo6NWZ1/Id6GgqUjB9uOc32Ou4yMzv5AMw1JG1t+HKDrCItgr5mbPj0yYRCOMYfM7mfv
         l2A0mrZJ8tOEeRkuWVjuNJWOcxglrdV9pob4qWPgh+k3LeBSg0XE9wkU1h0cwv0xUoHS
         jhNNI0kDyHLMt+D+q6mcz1Ym0EEtPIZkM4viqS9SiIgCnDCpy6A6hXaXM8Ms2ICsBn/6
         Ls8A==
X-Forwarded-Encrypted: i=1; AHgh+Rq2kUGdI3kI4bzXnOGUft2EcCxTvQKkKPbnAgJ7MFUZvmhqMN46/cw/X0v0TfeXnhGoY3t9oo271blyYA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw29SkImz+te/SXf0ULEJrZ/KX5k1uWPhe3iE0LOzbIFmAqopPF
	rFEhfJNZY2/TjmT/cPrB9po8G7dC0vl8per1sTGiODe76hkfAP+0St26
X-Gm-Gg: AfdE7cnvNvX1wc6/LdlQi60Vz/O2TmznvJuX+wd5zJTbEHF6V5LzwTmw9Ny3DAu9kCW
	jp2RzySC5LVkZULFEevUtGPWQGYiaCkP5cobK5gBk2fhtFrQam04x16J+bQT3QHMuVI0sfVaWkH
	/bJYeYwMNum4GMHkvqN4DxBnzn8I2Cl1HDqdUJ/598L/NnynYYPLlHs8BNlRmu2R5aUoyL6b/tN
	Hsoxduo/9QoVAl8W1TGXYSOda5DmshI7a6zzxePdsINScuBfoqoIE1mibYIYlPspUdJs9lhUVF/
	UFqwp5M8RnWgifkfTEZABhsgdmUbROr8uMVovlYyLCA90NnqBf1BoAfYLgKbqg9qXOyvPO/pW2T
	nC1MNbPi0niHQMo4GI+ShMkVMIeUpRet8hqZ7R6yMLz5itkNLkAFw68aMgtsl2hNV4Plbcu0YNi
	tDfcbSnqKI6+LfaID2fZEoQ2ouXo0Xw6GMaFX1WA8xdeh8ElE=
X-Received: by 2002:a05:690e:4397:b0:664:ae67:b674 with SMTP id 956f58d0204a3-66521bca8b7mr5877472d50.80.1783028879729;
        Thu, 02 Jul 2026 14:47:59 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:47:59 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
Date: Thu,  2 Jul 2026 17:47:47 -0400
Message-ID: <20260702214750.3428694-2-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
It is not backwards-compatible with the A31 programming model: the
control register has a pulse capture mode field (bits [7:6]) that
resets to a value which captures no pulses at all, and the sample
clock divider is now selectable via SPLCFG bits [1:0] instead of
being fixed at the old module clock / 64.

Since a kernel driving it as an A31 CIR receives nothing, add the
compatible as a standalone entry rather than under the
allwinner,sun6i-a31-ir fallback.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 42dfe22ad5f1..06656058ce91 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -19,6 +19,7 @@ properties:
       - const: allwinner,sun4i-a10-ir
       - const: allwinner,sun5i-a13-ir
       - const: allwinner,sun6i-a31-ir
+      - const: allwinner,sun55i-a523-ir
       - items:
           - enum:
               - allwinner,suniv-f1c100s-ir
-- 
2.54.0

