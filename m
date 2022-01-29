Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E422C82
	for <linux-sunxi@lists.linux.dev>; Sat, 29 Jan 2022 15:58:52 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id jx6so27274492ejb.0
        for <linux-sunxi@lists.linux.dev>; Sat, 29 Jan 2022 07:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IFgiQSEIxvRFHceqRi7+if2E4mQXAORTDUwgnfOJ0pk=;
        b=B+PAs9QbjYtzoY2bXCJNdgII7SAIPUeFZUIx5aLeIt0xVlBX6a+5sFpYdmLvQlU2+Z
         46VR9g2nMN1FYbQdaKfGwFpL7pU+5Z/NPLSYC0LeiAiRhweFo/64RE6uGJKVNItVhKLL
         kheFIuxWobnK5QviHx58cpd3Na0Zy10uUkLKgZ9qjIlFAAT05ESBzs6S4fT3Z/uLlgzV
         mh03hozDV7u96k69/7nZAbOgF7cPoqY0cZiUue99lFxd2p2S/OOTsSrDVLsGnjfX0bK4
         uffGccXGx9ZYFdLo0TN4L4EFlLnXybHGScfFr0OgtAPZVqramoZP6hGX4hmKf8GebJc9
         AQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IFgiQSEIxvRFHceqRi7+if2E4mQXAORTDUwgnfOJ0pk=;
        b=RnTEKmLQBtih+Lz+XURXBISKhcLs1boowm+tlZgtgyB3RmzKsDbBrGxTG3kwp3LA+W
         UsO4Rocq2P4HGcbxr7TgfO1H+9w04FS2K6rXins5t1N+k22gWuWfrTjN9J1ZuIEKrMDU
         0gj49A49+6zWBOHbnNoXNW966sZsk6I/9nFoGLrhimCu7+btcVm19K7hJs677H/jlxGk
         PH5ctTUfHZkwpvPnwwu+qGmDYZuZy1Fb+VcgRNsu48G8PTM0A4VVLIyOM9VENOMsPtkg
         x9F9YMqu108mYDmPzag4NA5nElNaj9ZxiBR/AUx5s8lqfMCJEfPPXoR1FZPCcrtrzZuf
         eIFw==
X-Gm-Message-State: AOAM532Q5Loz9eN+V7/SgI2JsCttl++ilRbceglTB26IwAFgTcNE/iQs
	yCzWeMuvNo10QC+8L7ZJa3w=
X-Google-Smtp-Source: ABdhPJzEPigxTDh6v3KKckGbv7FDZGY85PN4Dv6AQ8N1ahM+K+kf+bU/rY8BvXItbRunqwsTuvTU/g==
X-Received: by 2002:a17:906:c10a:: with SMTP id do10mr10860285ejc.420.1643471931036;
        Sat, 29 Jan 2022 07:58:51 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id u17sm11164935ejb.31.2022.01.29.07.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 07:58:50 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/2] sunxi: Fix H616 DRAM read calibration for dual rank
Date: Sat, 29 Jan 2022 16:58:43 +0100
Message-Id: <20220129155843.111741-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220129155843.111741-1-jernej.skrabec@gmail.com>
References: <20220129155843.111741-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although it isn't known what bit 0 in PHY reg 8 does, it's obvious that
it has to be set before read calibration and cleared afterwards. This is
already done for first rank, but not for second (copy & paste error.)

Fix it.

Fixes: f4317dbd06b6 ("sunxi: Add H616 DRAM support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/dram_sun50i_h616.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index 76f520f4e780..83e8abc2f8d8 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -360,7 +360,7 @@ static bool mctl_phy_read_calibration(struct dram_para *para)
 			}
 		}
 
-		setbits_le32(SUNXI_DRAM_PHY0_BASE + 8, 1);
+		clrbits_le32(SUNXI_DRAM_PHY0_BASE + 8, 1);
 	}
 
 	clrbits_le32(SUNXI_DRAM_PHY0_BASE + 8, 0x30);
-- 
2.35.0

