Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926CB2CA2
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 14:27:21 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id w14so21705912edd.10
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 06:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tj58222vBGaJNZUxpfMnXiesr9q+ku4pE3JNOQZjqf0=;
        b=R5HhxsP+jJ8CYbcwIeQFhyyeFPgqS01oXgdCSVPwZvnZu80lBnYHuGPze1TQHVghhC
         IKYgbvWA2vZa/3is7GphFPMUc86nVuFVGSuhxoFLA58Gtz1Bka0Mb5E/l7s52RuZcE25
         8wLKK7rjtVM35YUO6lrHBscJAZPD6JgOETU8xHySoDyHoCuxCQTRNEU1AM86nFcQNubw
         PTWXFnxAyqA9qnlQiN7jTD5pZL/Rhbzi82wf1gYFez5t4eFdlBqlH0s90XWAQQyFNBi0
         zIDaMw18GfxD2SqHjSlMzFgexnhyqNW0nz4/cvYGxugU2a/EwSulylYWLTyREA+rwTBS
         63qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tj58222vBGaJNZUxpfMnXiesr9q+ku4pE3JNOQZjqf0=;
        b=hoIBYPGwFkaj/HMCrbyXAVA/jVkwNE7dzxo5ENiAsiP3Sh3MblxjOFS41UpzPesg7n
         yp8t2JPK9S1hiScjzvhqdRxWXhziZbzzQwOzA62gOMQNC0Fwid+xM/EI03xeuRuwpuhE
         xxJViBbhgetXD3CyoGnD3d4Vq7ufIzIT7F5nc6NNa/Cc4glvYX+w24SCAjM/P02FccO+
         ksb5/k+PuB/aULdA3li5Ylpz695xOOccRREfLcrMHWR7xRD20o2DknDbtS+S/AngLqE2
         7SOW7ObkYZbiWs+01ZnhBj7Nf3gnT2/4n0rdz9dl57o0OenwDbo2odze9p4YkQgmXk7f
         8Zaw==
X-Gm-Message-State: AOAM533JiO5YYTC2zn9ELWuP803EnVpuHvb3vKcIVD7gOZ4KlgSEEsZz
	20t+X+akIVV9pESMCUb+I53gpnsvooI=
X-Google-Smtp-Source: ABdhPJww8oSymYpyIfXgbsHS3dxINwHEYqV4A5/Qz1jXKroVdY44hsu4ogttgSfEfMY0QO2Alb9ufw==
X-Received: by 2002:aa7:d3c3:: with SMTP id o3mr16761742edr.201.1643552839736;
        Sun, 30 Jan 2022 06:27:19 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id o14sm12274616eju.118.2022.01.30.06.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 06:27:19 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com
Cc: samuel@sholland.org,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/3] sunxi: H6/H616: PRCM updates
Date: Sun, 30 Jan 2022 15:27:12 +0100
Message-Id: <20220130142715.291427-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During H616 boot0 blob and H6 boot0 sources analysis, I noticed that
SPL doesn't set resistor calibration and PLL LDO on H6. Tests didn't
show any observable difference, but nevertheless it's better to mimick
boot0 behaviour.

In the process I also added names for few PRCM registers so it's
clearer what code does.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (3):
  sunxi: prcm: Add a few registers
  sunxi: clock: H6/H616: Add resistor calibration
  sunxi: clock: H6: Adjust PLL LDO before clock setup

 arch/arm/include/asm/arch-sunxi/prcm_sun50i.h | 10 ++++++++++
 arch/arm/mach-sunxi/clock_sun50i_h6.c         | 20 ++++++++++++++++---
 arch/arm/mach-sunxi/dram_sun50i_h6.c          |  8 +++++---
 arch/arm/mach-sunxi/dram_sun50i_h616.c        |  7 +++++--
 4 files changed, 37 insertions(+), 8 deletions(-)

-- 
2.35.1

