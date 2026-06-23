Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314413ACA77
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 20:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247728; cv=none; b=KqwxP+AHw7TpqGwaHq6Na1ujvlDmzmXY1FmK8aUw3y3Q1IRfEZNopmHNYljrDbs/ZOgaigE6MNf1hdGCVMRqdBeKIimYBUhfW+a7RSAVfOG36uwNHS+1+RBPfPQD7USefwTv47PG34xy157XdVWDB3c2YHpq5zFuxMfAEZqRp+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247728; c=relaxed/simple;
	bh=c/ZEvKrH8NyUFFYM1KdAFACpOhsENfDRqpjWjQ8d+Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0zx+AmbxIYSv4cpKZXnSt/yA0NqovEEISRL434A3TQcV4e3rTVYzRpCfcUjYKAgQ+r4hC9VS7OKZxo+9q8ix+zcm9iVOrXxZSthr0wfVM2hYzYd7U3+iwLbv6dS6AF/p07cQaoShffIYl566N4k60Iwb8U0mM0pzrh8TREb81E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=roAdjYsM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="roAdjYsM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-462cdb88d01so251953f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 13:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247722; x=1782852522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wchiVNh3rpBI2XZC92te0JGKBDBHe7YjoYm2rNU3USE=;
        b=roAdjYsMQud+g1J5z8i7BohrB3eamFkC8gU0S3oa2nj07usZ6AFxAA9VWyM0Yp7iaZ
         VVL52LTAFLLhCXy0CVFKr0uSlBrZBLG15xFXnKstgSqp6tUJxG3PEdWxz8CLopxN7vVE
         IhFOB5Oypqftx39Kv/UAopx9qnkuYlHcuk8P8IeGUCGRhDLwCnjwOAsMw98DHdTtk9+R
         X3aXz63F6dB1Xvfx9kWvT1bsG5XubWba/YE6v2LXDt6x+VHY7ZyAbAbuiVLitbRNucoO
         9ZekTnofwL1ErLgrHR79hbcC3CSwGECjxjJml3t+siZ/n315hVOHs3RsZbvJ0LS/JCND
         PPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247722; x=1782852522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wchiVNh3rpBI2XZC92te0JGKBDBHe7YjoYm2rNU3USE=;
        b=b1bXw++goXNecLIlodCO+ZE08K9p+wmtPT5aqc4PrT2jzD9D4IyArIgjK6oJmw/axk
         lVoJ9pTCVsonhhCrEQDS8xS5IGGRFYsFujAo+dnN9XLrJ+zvaf3nvn3seDQWs0eC8hbO
         EwnGf1WU9hJcw/PS/VMWWQVFu/ew/A9ZrValS/QnhkrF/ny7XhnLqqOqU5vv0/hpWAKg
         xqibV7Iz0Wj7P4fLAq+lugH9wruFYqspZ5q2DYEbRRCbQ9RwbIqqtFjlJKr3VkvJpsn7
         MdVzTPhIELeP099eBfdEQg3cfhwXHQ18gJm/W1uUK8gnCQhRilsta0Dbt5XoJ7i7uycr
         goQg==
X-Forwarded-Encrypted: i=1; AHgh+RoNHpP2PFluW1zbSuFRD/Kg9fLX/kD9ldsOS5fXNvykNIvEc2uJkgjWTgPFowkyr582jTe/GaT2cX00cw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcZr3f8Yx/MY+RkSINnzAxY9WSssyBmnCAn3hSnUVTy3Z+LkdN
	lQaX/YJhaGhX1szIAwf6F8LFiTsA/muvaFX3eBM0NvhF8+7Ub5eK9A2R
X-Gm-Gg: AfdE7cllg6SzVwh9ZADVhagpKfXl1HWb0Rh/tDFrdF2Fbswanbrm/UmRF+/E54deBws
	114UIQZQlVc673oTS4WvzA5zJH/4O5Dj+O5p2b7zDmuL480zU3ClpSnK3VMB7ywULrgayP53KkO
	6zSo0P8WiTIBwlBIQ1HFeanPnAXAmzGxr8UDu8xsUvr27qCoxGC/lYCJRKMyGZGnE5SQGzRpngm
	u389Pw+yOx7cSR3JDIpOrIkRaDkJYx+rue98u45R49QKgOiwv8C6pQwwTmDQQ76Cjuvt5tfOo/b
	6vWokFQagXt65dqsSIXjd6jD+3eIsAnaoTjTqbTpOlQbZMpvP7NF65im77rpCrWPpE3/Yij0xAB
	GZvs3B3Traci9E1bg1fa+tTrQnWuwzy4MCRMauWi4nsGUe2bKnGZoRsZY7XLUvzQENmmvPhgme0
	+jy4nzLuS2sO7+r1mxm4LaDHuTTY9eRNaFcaPiD9qGBw==
X-Received: by 2002:a05:6000:4284:b0:464:fff6:489a with SMTP id ffacd0b85a97d-46a7e9f3eacmr9075904f8f.6.1782247721730;
        Tue, 23 Jun 2026 13:48:41 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:40 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v5 4/6] dt-bindings: input: sun4i-lradc-keys: Add A100/A133 compatible
Date: Tue, 23 Jun 2026 22:48:16 +0200
Message-ID: <20260623204824.691832-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A100/A133 SoCs have an LRADC which is compatible with the
versions in existing SoCs. Add a compatible string for A100, with the R329
fallback.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
- no changes
v4:
- new patch

 .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
index 6bdb8040be65..524c8b51f53f 100644
--- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
@@ -23,6 +23,7 @@ properties:
       - const: allwinner,sun50i-r329-lradc
       - items:
           - enum:
+              - allwinner,sun50i-a100-lradc
               - allwinner,sun50i-h616-lradc
               - allwinner,sun20i-d1-lradc
           - const: allwinner,sun50i-r329-lradc
-- 
2.54.0

