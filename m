Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EC8626
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Oct 2022 07:46:04 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id r18so6181644pgr.12
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Oct 2022 00:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+3XI07NIU0r0BcSpY4o4wAED1j8IMzL6p8JlqJ+P7M=;
        b=HNX7B3LX5uGls5yoQ/5rcdO3NyrtZTcsWkpJx9uEferAxFEMGahSk77KWsyjQqM081
         SmHGfTKBcsKNRcnCMtbYzC8/QpkdGVvCB+DcTyYY5nzGGJMYLyY63doCjtrtagYKSqbQ
         72KKKHZQvFXE3hErYtcA+0HNZoqNXtZfwFCWW3mzNxmOInHiyLd2jX9gK2eYWnHL56dY
         6wUHiYGv02nGQ49T5B5Y4MEdC1rshkasUy6h29VDsZOXdecYgPtscpg17YkBPeLmj77x
         qV/SwnwvnB8CgsNWcl7X6G2uhmBG0gSJF8EqEQmVyrv389h15pcTgy83XkMOCb0cnIB8
         DA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+3XI07NIU0r0BcSpY4o4wAED1j8IMzL6p8JlqJ+P7M=;
        b=UGV2StDC44WCx8EPUREAEqFpNY/17DxjJAxaggzD+CAMnnu9OEcKmW/ivkGH2fsrAP
         jHxNAYvAQov51qWfMX1qNtZg4Zv1SqseQEGO4bZOjUnHG53WbqbkvQaTL/OMGdXANCiU
         m8oD+XfIEf1jgCLIcGEt3KETS+9Y4C0HMCHVEDJP8oxISe8aeXGb+nhqsH57g98hlpYO
         SW5ebuZsChQXhESxfvTOZjoj581Wb5xqM9jFwII2PEG91PoS6PmEL3Fy4EqGfTZf4Zqe
         yqU5u6kOkH2epTCSw+0BMs7/mdUhcfia7YlvRS8WkYddHD6g+sQBVuv/VUX4YG0co8QF
         5TGw==
X-Gm-Message-State: ACrzQf2kZmkrOC51aPS1igNVrTdMvXXwcb29mRKMobew0R3XSSUl8ylP
	b57tL4XHXgvmTQeWT5x28Q==
X-Google-Smtp-Source: AMsMyM7hnbn4FtvSizf8k1Mr/Ab9tVqFbA04W4ZUETz4RdenA5XTA4G0THtH48QpRTXAq92reGBQTA==
X-Received: by 2002:a63:6505:0:b0:46e:d30b:8f9 with SMTP id z5-20020a636505000000b0046ed30b08f9mr6658694pgb.366.1666511164097;
        Sun, 23 Oct 2022 00:46:04 -0700 (PDT)
Received: from localhost.localdomain ([121.34.154.42])
        by smtp.gmail.com with ESMTPSA id ge12-20020a17090b0e0c00b0020aa1bd91e4sm4101976pjb.4.2022.10.23.00.46.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Oct 2022 00:46:03 -0700 (PDT)
From: Ban Tao <fengzheng923@gmail.com>
To: fengzheng923@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: sun50i-dmic: avoid unused variable warning for sun50i_dmic_of_match
Date: Sun, 23 Oct 2022 00:44:45 -0700
Message-Id: <1666511085-2748-1-git-send-email-fengzheng923@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

In configurations with CONFIG_OF=n, we get a harmless build warning:

sound/soc/sunxi/sun50i-dmic.c:268:34: warning: unused variable
'sun50i_dmic_of_match' [-Wunused-const-variable]

Signed-off-by: Ban Tao <fengzheng923@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
v1->v2:Add "Acked-by" tag.
---
 sound/soc/sunxi/sun50i-dmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index 86cff5a..62509cb 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -391,7 +391,7 @@ static const struct dev_pm_ops sun50i_dmic_pm = {
 static struct platform_driver sun50i_dmic_driver = {
 	.driver         = {
 		.name   = "sun50i-dmic",
-		.of_match_table = of_match_ptr(sun50i_dmic_of_match),
+		.of_match_table = sun50i_dmic_of_match,
 		.pm     = &sun50i_dmic_pm,
 	},
 	.probe          = sun50i_dmic_probe,
-- 
2.7.4

