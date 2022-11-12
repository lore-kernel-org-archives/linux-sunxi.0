Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077591858
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:38 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so6736405wmi.1
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cr+dmUXwYhk1v9/2O+qCDGm1t9ap655KCmuuETwAAfU=;
        b=MumFOUIT6F0oTqa2MKSIxXzjznyN1d03ngR3WmJmd9nPISSXjX/WnD72h/8SlYoPdj
         oAG1lhUr266zcH3myKW/9IePllNdxFr77xG0kNEN9ut2q8JxwNO0+CGw/a1E3KZ/MikQ
         3+7hOQnu54Vr6BL8aS6OnwQCN+u3oyqWHhqzlZAWa5w7BkhCslsbFBdZOrWpdu663sY1
         90rbkHLdTELKQYVFpHFU895G/Kgq6VQatnHHetG/GJBgAhuTJw7AZepIgjJ90jLrwMJi
         qnQ6pKoDPRFyWP1tJDhdaXjtBKg8ngow/t4MpxuObqJIxll+ho5h8Ja/En29w+Pds/7u
         D4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cr+dmUXwYhk1v9/2O+qCDGm1t9ap655KCmuuETwAAfU=;
        b=tnxn10piQll7jlIggIzvCoxfB6ceGF5+wpxzwTta0JU3c4FBM/5S3gwncydQM23EPm
         wZlZB+/VU6YckLJc2/hbwyacYuE9JA6sw28h2SuagCeJfqexKYBqN1SWKbSWjNmzvrtq
         SAgK1LXwvSfeSOTvGDPiQaCSqp5fhAt9LqOiwXmDGUIIIGpTA6oKkj72l+tbxEH8AwSp
         pTF8meOchR0qEMShofksVGkjzuxem6VxWWVRsIggVgF4hh6PhxaYNnsnib1TU/ihaiZ5
         Ee1ioF/VOaAavJuMt0S9xC2ObZvamPatsHSUJfw3rnd4uCdKFYX6LvNplr7loyRh52xz
         zYHQ==
X-Gm-Message-State: ANoB5pkTULhO7FolHoMYrozaIAn4VKDtbsZafG0KdxPNUkUTLoqIej5a
	HIptWcuZXUnEgQ7SysmVUIg=
X-Google-Smtp-Source: AA0mqf4hcLFxf00Mda7WDy2hbjsIkGnilq2AHVMUUHeYNYCqZ7QPY0xot1ukZe9qPg3TpukTAcLy5A==
X-Received: by 2002:a05:600c:d7:b0:3cf:b545:596 with SMTP id u23-20020a05600c00d700b003cfb5450596mr4039671wmm.49.1668266377341;
        Sat, 12 Nov 2022 07:19:37 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id n13-20020adff08d000000b002364c77bcacsm4534160wro.38.2022.11.12.07.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:37 -0800 (PST)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lee@kernel.org
Cc: mani@kernel.org,
	cristian.ciocaltea@gmail.com,
	wens@csie.org,
	tharvey@gateworks.com,
	cw00.choi@samsung.com,
	krzysztof.kozlowski@linaro.org,
	brgl@bgdev.pl,
	mazziesaccount@gmail.com,
	orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-kernel@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 01/18] mfd: 88pm800: Replace irqchip mask_invert with unmask_base
Date: Sat, 12 Nov 2022 15:18:18 +0000
Message-Id: <20221112151835.39059-2-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove use of the deprecated mask_invert flag. Inverted mask
registers (where a '1' bit enables an IRQ) can be described more
directly as an unmask register.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/88pm800.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
index a30e47b74327..20742793b22d 100644
--- a/drivers/mfd/88pm800.c
+++ b/drivers/mfd/88pm800.c
@@ -398,9 +398,8 @@ static struct regmap_irq_chip pm800_irq_chip = {
 
 	.num_regs = 4,
 	.status_base = PM800_INT_STATUS1,
-	.mask_base = PM800_INT_ENA_1,
+	.unmask_base = PM800_INT_ENA_1,
 	.ack_base = PM800_INT_STATUS1,
-	.mask_invert = 1,
 };
 
 static int pm800_pages_init(struct pm80x_chip *chip)
-- 
2.38.1

