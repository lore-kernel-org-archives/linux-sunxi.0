Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850643B29E
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 03:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752206306; cv=none; b=Y+v+PtAZ0hmjQTIUuEBv7gnjzslo6HqbJtBVKUDq3l/eG++vboblkPYsy5ZWcR1mDGYl/xFev1OOM/42z+b3N6G2yLWmwcKEgcO9l6s95+zt7qufYx9sgdmbxUpxvEV+qv6Tn7E9+SKiMEVdXjKBbReq7osbART96AWh6JzkqUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752206306; c=relaxed/simple;
	bh=eCnvz1UlgpG0eJcxw9ECiK+Uk5BVPyIsGzFKnmJ+HQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hYr9fYk9n4Ub3hwTD8vdU1hAkJW12jnsjXnK7fjmR3SA6wzD2K+nsfRAigCdmcqwuyCAGyrZnvMIO37yxy5WogaLeC4UDuwePSeWZp8Q15oVGsaMH1uhMGB70kX7lQv4xWwYmP817wO03sC8DUrJsR/3N8sBzZW5D6lySqdvNXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHVHHD27; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHVHHD27"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so2123097e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Jul 2025 20:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752206302; x=1752811102; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7CteOKcSR5wpkrtCw/0yNUE4pwZlcXOtUiqDdXOWRc=;
        b=KHVHHD27eKoJxmjlmcl0LxZL+dtlb3MEHnp0rulbcmCbvxMTMXjsjehGfc3bwnoVoc
         +CaR3f13kUpDb8fONoQXdhUnBHKubcsF3MoZ4xa8tUdhz67Bc//bAY9LLZ9xgjlvRT0m
         LtYPGgSk6vl4lN0HCEvVLKro7xZqa/PyFuXxv4EA/r7yIQ0Dh8kKFiEnxTHFJsGH/FO9
         vu+Ytv+NdmeJk1m8xLvPiBccb/7jjhfy82Ld38MoMmdWizwXsdjqYO4CPH50QaMkCP+g
         LLYk+sftOsde9bQSXgfsE1CUGatOIyJ+PKibFlVoiYorWURLCDYouW49UNvnIub/myct
         aLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752206302; x=1752811102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7CteOKcSR5wpkrtCw/0yNUE4pwZlcXOtUiqDdXOWRc=;
        b=QUwXaljS+Svth6zqEkMZOOgz/y3fItcAq9abCGlT/VitWpP+D/FgkOJzHBGE9VVC/F
         DCEA0MTBz1czAb754bPy/X+FTYq981Ecq/b4ozSpKaUNa0k54IGx6NgAYCjfQdijwOLi
         0mfKiAaKcuGVHCt9Y2zsal4E3hGKpQ5AFzjixtiOOmnvMy3LUSZnJelCln7QzUPAq8z0
         2D5FcKUDqdLUfhU+E30edpUzJE8Zu4cqWVzNsVZlitl5TuGTGhBUxlvT0Awt8ZxA1WMg
         GgVFQhCYXWn+ZT6Pm2JaUUsLZBk+BTeRwL3gs5vVo/aljanBiTmKbiqHQwopSneKQvwU
         IwZg==
X-Forwarded-Encrypted: i=1; AJvYcCVGbqE8/0b6Lsntx5zeJGIRZZYvnwyNQakZWfp47bPo5Kp6N9NDtekfEKpku4JLOLLuyzn30gb5Blm0Qg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8pq39ZxmkYQZ9UVrTUTu3tSOJK30UKm0NRJ/qWCdSTSJ6lmbe
	h9PGvGH31v+fS/vbFFISBcVvEG8hJyySHEI4IEIZQDaPz0MyDRcm9KW0
X-Gm-Gg: ASbGncvR3l1jW7ZQb7f1Df70nk78w99ATBkyb8qAt4MScWaWdwPRLtnYmekXwPQ0Gui
	/oMrMzO0a4WQvFnbEKhYzIbyiR5jQPYCI/y2l6Z3ZW0xGHDhU6FatKQYdVOWqucd4g4THAx8LeH
	YcTk7xJ/1KJF5s3dcjOlvKkt/+GkXxEuRi+W/u+1dtXyehqqZtK6YzG7YHGa45oCzhrjq6NpZUU
	vk54B+BSUDoI6Iyf077i1psoGyuZqVMMJ3hLPW9RNYH7gjhYwp9frFhSXKvphNvBC9n4O5muvI/
	p/6JBwo5hrw+PjsY9GI8sxK9hAdzzCN2+GLiLvbhLtDa3fXTewO8cr/xY/6k1g7HQkny8QtWr7+
	4tDiL0FGuxzQ=
X-Google-Smtp-Source: AGHT+IGqjUC6+LzbpSLGosnqY439fvJxlZO9uR+Y1dc/WDIuRFhbiDBiR8QodGnlwa6oUPkK4Xs4TQ==
X-Received: by 2002:a2e:be11:0:b0:32c:ef7a:ccf9 with SMTP id 38308e7fff4ca-3305348a960mr3406601fa.32.1752206301782;
        Thu, 10 Jul 2025 20:58:21 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa2943d46sm4971191fa.40.2025.07.10.20.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 20:58:21 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.or>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] arm64: sunxi: a523: Enable Mali GPU
Date: Fri, 11 Jul 2025 11:57:26 +0800
Message-ID: <20250711035730.17507-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

This patch adds gpu support on devices with a523 processor.

$ dmesg | grep panfrost
[    3.826968] panfrost 1800000.gpu: clock rate = 432000000
[    3.832305] panfrost 1800000.gpu: bus_clock rate = 200000000
[    3.838353] panfrost 1800000.gpu: mali-g57 id 0x9091 major 0x0 minor 0x1
               status 0x0
[    3.846050] panfrost 1800000.gpu: features: 00000000,000019f7, issues:
               00000001,80000400
[    3.854134] panfrost 1800000.gpu: Features: L2:0x07110206 Shader:0x00000000
               Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[    3.866011] panfrost 1800000.gpu: shader_present=0x1 l2_present=0x1
[    3.874108] [drm] Initialized panfrost 1.3.0 for 1800000.gpu on minor 0

Since there is no support for image output yet, it may be difficult to confirm
functionality. This can be done by running weston with vnc access using
the command:
$ weston --renderer=gl --backend=vnc --disable-transport-layer-security
--xwayland --width=640 --height=480

After that I was able to run glmark2 with a terrain result of 30 fps,
while I can see that there is a load on the GPU in nvtop and the CPU remains
unloaded.

Tested on x96qproplus and walnutpi 2b devices.

Based on v6.16-rc5 with patches:
https://lore.kernel.org/all/20250628054438.2864220-1-wens@kernel.org
https://lore.kernel.org/linux-sunxi/20250628161608.3072968-1-wens@kernel.org
https://lore.kernel.org/linux-sunxi/20250627152918.2606728-1-wens@kernel.org/

Changes from v1:
- added compatible to the documentation
v1: https://lore.kernel.org/linux-sunxi/CAGb2v67Pu7CTJx3K=3CVSbQ9mNB-4Vrq+iaA+hUWtxdwS2aD0Q@mail.gmail.com

Mikhail Kalashnikov (3):
  dt-bindings: gpu: mali-bifrost: Add Allwinner A523 compatible
  arm64: dts: allwinner: a523: add Mali GPU node
  arm64: dts: allwinner: a523: enable Mali GPU for all boards

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml |  1 +
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi    | 15 +++++++++++++++
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  |  5 +++++
 .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts   |  5 +++++
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts  |  5 +++++
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts     |  5 +++++
 6 files changed, 36 insertions(+)

-- 
2.50.0

