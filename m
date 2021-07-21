Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF99B72
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Jul 2021 20:08:54 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id c12so3458009wrt.3
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Jul 2021 13:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x6EutQE4FqvS74NAlrxQkWcx53oV130UW/bI7WrrBzg=;
        b=QDPdbsGqpdiDce06xAc2kqd5LqhpF3Wy/f3d69KqaPi1YvEHO2jYlYUWVLsYwNXUbV
         xN3yA+8BCcVtHz5j9TGJgqLFcd9geuyrv54XcYskHdo2bCfU5i/+ugnig5yrS8VOIssX
         Lq/AHrNAR6Fjw7S8O9q6dVqk0T5pSjXjAjJ8m1vPDEkKyL1Dzml7vie1E7OhAWcpyvnr
         NJkCe6uPZa7Tf7UAtLtKuRW6YS0or+8qZCwdf55sdl7wn8+tB3Ossg4VhYiW7ftTYAY/
         wxzuo92Pg8lZCRoFvKDoX5GX67M1lfP7d4Y6/xLC5LFZ0tWyIYjXcqer6cjSBX4mdoIF
         xZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x6EutQE4FqvS74NAlrxQkWcx53oV130UW/bI7WrrBzg=;
        b=KqrmcgNNZZp1wbL/m3XTfZ5rSjXjcXveFSNQPuQ5s1kxX5pD0z/fYQbTHJeHARrs4I
         as3TI77Xph8dh8VeWLXjJY2pKv4PWdiTTO5RCCtfm5D9bG9x98p+KP25uTDcGGDHW4mB
         jFKaeYh5vGOfQFYJCNG7GyxuxWPJT8P3yv2NsxQ8QfllzQzCye4oirp6bUyhRM3qrSK8
         2j/FN3kpzQh87hvCe8oRZxd3sxm70dmsBIWnTGoKv9AzIje+tviwwb3qKu/OjewmV8Hw
         Lbd/lAeth6gJ7ydaTzGw5c9m1ev8gTllvDhq4Qr1c/PSntw3rKecrylyvOfEbQv1R10i
         c/mg==
X-Gm-Message-State: AOAM5335MsI2M0aD4WafsIEpdpQa9+lRmAll81v7RDMi2z34DRGJhV2A
	NJ4tobDKdagd1C2McFT5gn03nJfctwNARw==
X-Google-Smtp-Source: ABdhPJyXut89uwmrQ6z/K4M5428MQGzr2KL0xdxshah/vl1jN7DmXpmJY+11e6EcMCiTdbPBWgldxg==
X-Received: by 2002:a5d:4912:: with SMTP id x18mr45935545wrq.310.1626898133125;
        Wed, 21 Jul 2021 13:08:53 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id k24sm28927162wrh.30.2021.07.21.13.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 13:08:51 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	jernej.skrabec@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: allwinner: h6: tanix-tx6: Enable eMMC
Date: Wed, 21 Jul 2021 22:08:30 +0200
Message-Id: <20210721200832.916644-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tanix TX6 box has a 32 GB eMMC module. With changes in this series, I
get following figures with hdparm -tT:

/dev/mmcblk2:
 Timing cached reads:   1638 MB in  2.00 seconds = 818.44 MB/sec
 Timing buffered disk reads: 376 MB in  3.01 seconds = 124.74 MB/sec

First patch only sets proper power supplies to GPIO banks and second
adds eMMC support.

Please take a look.

Best regards,
Jernej Skrabec

Jernej Skrabec (2):
  arm64: dts: allwinner: h6: tanix-tx6: Add PIO power supplies
  arm64: dts: allwinner: h6: tanix-tx6: enable emmc

 .../dts/allwinner/sun50i-h6-tanix-tx6.dts     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
2.32.0

