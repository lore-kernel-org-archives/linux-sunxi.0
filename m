Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEECAEC7
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Jan 2023 08:38:35 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id fc4so8372102ejc.12
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Jan 2023 00:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xOgzPUkVPsFJ6g/ffT102vjrzD0+OvtINIcm9iZZqT0=;
        b=p0uMCQyRwUkzuKw8jnTTRgB5Lb24wiA32+JQ4g5JXiTTzWapxZLkmKH/AaoUzsl29b
         2HH2BLb3ZN5SaZ6FIYCOx8kXkOC3P4DNu7RnjsjBZ64ZgqV16KM4WfENlfCKZRcDFGhx
         e9+yCGQtYUk6ePhkRuRLeoEGphudoLhd/IfNBhgECWQMmddKTtvTzpmaPnlwMMZ6ZqKm
         4/QbZJLjoizm6viFpHP+/C92bQXjAI+35+snGZd+4VdDvRrNuwEgbLNqh0UpfFxFnFGy
         OLfNuZywlX4MDcZQikowzBvlwxWEMGwiGFMvS2ODz3oqTqsh3HmYTNlyfjcBZ3uGee3e
         0WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOgzPUkVPsFJ6g/ffT102vjrzD0+OvtINIcm9iZZqT0=;
        b=yVYZsNPdrlOqlQ5hntek/tuz999cWxn96+z51yjR8mE+BkgHoTg0Nrt4c6o6AZXZJ6
         1jidZiZ5hNAgvhe3vcbem4I39kazSV6n89Nr3RSHsPzslH/qB6PyI91rJSZexK8v22tw
         +L4LLbkPTGSSHaZbqIDxAAy9S8kDwcfac53nl+S/vn0tCpUls+sH2WKhOypL0WKL/CO7
         OEiWZErQG67i4CS4IxtIWu1O5p7/ljpSk9MGUEfDQyt3iPihDhL7SKT7/fZ+8pYXRjun
         ZQmExVYPCcqs3SRD60/t5EzwCm1+9oxX36zMY3UY5rG7bIFRbW1VNlvYTVy/mcZXaUMJ
         8l4g==
X-Gm-Message-State: AFqh2kp908T21TcxgZ41jhLTtc9JARsrkC/Vr6Rk4OsXWxdyT3tUi2wX
	QcurLq6yN5L6vlo086qv+UXhIo+WM1HZBw==
X-Google-Smtp-Source: AMrXdXto/4G2M8RCTk63eS0nYKljP3eOEIHWa4CDLiaoEToyIbOSm80Ct5qBHA3otiYiDy6XgKH98g==
X-Received: by 2002:a17:907:a091:b0:7c1:23ef:4bb9 with SMTP id hu17-20020a170907a09100b007c123ef4bb9mr47302390ejc.13.1673080713744;
        Sat, 07 Jan 2023 00:38:33 -0800 (PST)
Received: from localhost.localdomain (mm-96-64-120-178.brest.dynamic.pppoe.byfly.by. [178.120.64.96])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906539600b0080b3299ebddsm1226146ejo.13.2023.01.07.00.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 00:38:33 -0800 (PST)
From: Oleg Verych <olecom@gmail.com>
To: linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Cc: Oleg Verych <olecom@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:ALLWINNER A10 CSI DRIVER)
Subject: [PATCH] media: sun4i-csi: Fix 'Unbalanced pm_runtime_enable!'
Date: Sat,  7 Jan 2023 11:37:49 +0300
Message-Id: <20230107083749.2419-1-olecom@gmail.com>
X-Mailer: git-send-email 2.35.1.windows.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When removing the module, balance PM runtime enable with
the corresponding disable call.

Signed-off-by: Oleg Verych <olecom@gmail.com>
---

dmesg:
```
[   32.570802] i2c-core: driver [ov5640] registered
[   32.585345] sun4i-csi 1c09000.csi: Device registered as video0
[  396.520467] random: crng init done
[ 1603.050944] ov5640 2-003c: remove
[ 1603.051878] i2c-core: driver [ov5640] unregistered
...
[ 1603.108832] i2c-core: driver [ov5640] registered
[ 1603.119400] sun4i-csi 1c09000.csi: Device registered as video0
[ 1603.119984] sun4i-csi 1c09000.csi: Unbalanced pm_runtime_enable!
```

 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index 18e6c65f4..86c5235a0 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -264,6 +264,7 @@ static int sun4i_csi_remove(struct platform_device *pdev)
 {
 	struct sun4i_csi *csi = platform_get_drvdata(pdev);
 
+	pm_runtime_disable(&pdev->dev);
 	v4l2_async_nf_unregister(&csi->notifier);
 	v4l2_async_nf_cleanup(&csi->notifier);
 	vb2_video_unregister_device(&csi->vdev);
-- 
2.20.1
