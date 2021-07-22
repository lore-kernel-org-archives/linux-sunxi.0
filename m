Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F8B72
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 16:12:28 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id m2so6544809wrq.2
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 09:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DknKiUJ1n/RLZ4+I9ca+avCYVdAr6cHwKq7eFg5+Szw=;
        b=Gxc6+feSDwxy/kDJZFwuTtl8x0XIhG4/HY6AJSVZQS/yMXLirtt46OFoBlypl0kK9p
         G0pSbtGUQxF9MskmpLxHrIlptkC5xdNlNt4rDmjFkJtIhODYLVWu77dyo6kFWRb+952x
         IhOeM0SYJznAWqJaDUvoqgtsuKlkxVOWORg+9GZmxO4nK5HhEa4vFZz9HAx5Aj9sv73T
         StVdp/no0rd2qviEsN0eUXtRPMu5sv8W7pvvwM7buP6PCJ38xjxHaLOgoIMlVYIRSq/0
         CfNu3DKOrdjw1ksahy8d9OgQYTgl/YN8IeFTWRlpOXc1SM2dNtrZCYlknLm09b9qKkGI
         DyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DknKiUJ1n/RLZ4+I9ca+avCYVdAr6cHwKq7eFg5+Szw=;
        b=bZlWFD2F22DkZ2AELuI6auFPsnqgeLJVFgqeKHBGMpFrlFQlJGF0j57T7iPCogkeCB
         mHnWBJL8/fJfE8XXuziPan/QABBwNB2W/27J0IJQF2dbpQe9+36m387heONCCDjxBaxM
         DGnY9GBGGuWo0uejoqKFZJg6MUFfiKmyy72mR7FhPXsH0fFYhStQf1mUI6cKvhjhC1gp
         1MDBqW9xuCgWXtXjHiNOanPaiK0YYKUCP3HDat5nRmjWUXfwN/ZDYgE8SdfQijRaTvY4
         noRtT2ltityaqEg8GdWHUZ/A4YVv5X/b8H38EnKOcKknYVLTLtLyreOMpEWUXE5Ktbmm
         pIaA==
X-Gm-Message-State: AOAM5320KhgvRPnYfDGNv1zRd58enWyGAEyV0cWLXrhjsPJWzLhDyGR0
	oG/QTX+XV88/btD82Y5UTR4=
X-Google-Smtp-Source: ABdhPJxus3TmI2AC0/9MZCiNd+lOPiUbsD2XoBS2EVm2jWx2T4xw2ho8fBhw+wTDLElVUsKpKhKTRQ==
X-Received: by 2002:adf:eed0:: with SMTP id a16mr730587wrp.324.1626970346872;
        Thu, 22 Jul 2021 09:12:26 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id z6sm3585363wmp.1.2021.07.22.09.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 09:12:26 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	jernej.skrabec@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: allwinner: h6: tanix-tx6: Enable eMMC
Date: Thu, 22 Jul 2021 18:12:17 +0200
Message-Id: <20210722161220.51181-1-jernej.skrabec@gmail.com>
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

First patch fixes regulator node names. Second patch sets proper power
supplies to GPIO banks and third adds eMMC support.

Please take a look.

Best regards,
Jernej Skrabec

Changes from v1:
- added patch 1 (fixing regulator node names with "regulator-" prefix)
- fixed regulator node name in patch 2 (adding "regulator-" prefix)

Jernej Skrabec (3):
  arm64: dts: allwinner: h6: tanix-tx6: Fix regulator node names
  arm64: dts: allwinner: h6: tanix-tx6: Add PIO power supplies
  arm64: dts: allwinner: h6: tanix-tx6: enable emmc

 .../dts/allwinner/sun50i-h6-tanix-tx6.dts     | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

-- 
2.32.0

