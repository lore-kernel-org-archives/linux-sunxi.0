Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1DB2C88
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Oct 2021 13:12:59 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id a25so12677434edx.8
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Oct 2021 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iBrOklT6wRz3+4Sv0nSOix/uEw45k7IhgJcWd50H2V4=;
        b=deOrvOSZJ7Ax/hHX/I0bj/ua6fjX1rP1DhOlu075couX1a3c1NVd1vCXiKTksJ8yXW
         qp4uXHhYMHHGxeF0zRIXPw9gurIoJ3aRUNnKbOAe8ArOMSk57YGOgDvnqpZIjI5pEo4Z
         cNOwb5tFsa/EZb+qlgBK9hUuhTQpDnP7tE1vX1OxMa5fUH/G9FCb1T2XFaA3XjPmvKVd
         dPYjOPOJrqXvXlcYtNWa+RaDM/Y8Rn+1e9mqNRVeUb4kvgVK7Ntrb0cdAT9Ackzt55Vo
         Nf7tiQol+2HlOzjTdRwPlexTUAyoCtbWQg81M4LN82vslZ3ear0azg0nfJ7vueyiZAuk
         6H/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iBrOklT6wRz3+4Sv0nSOix/uEw45k7IhgJcWd50H2V4=;
        b=kf4rHKm0NrdG4H0U+Dtu2y8BkzNjKDYme5qk7lwV3zQvemO8qPd+v5bTpEG9CdscTF
         PPxChF5WSly8FZNxruWkQz8nKzBFof1rbsQCfYE7XzIXyWxYE9emGj5Ubb6QtAajED0L
         yosNVsOnZEbAXmKMi9UzKSRP9baJnnE+a114XZywevwaCLJM5rB9gWesImpIcTMTStGl
         7VRLDSC9hfwLbVvwG/iqmnTXf2VRFbgatbz0vO0bbbvjGH9BP0MhTTrVIcpM5X+5W6Do
         vpCY4onv3D3fTv49zwk+XKiyYHhL1Nu8q9cz8jwcM7lgObBaU+ekxxNi0Zt5TY8Uf15X
         lzTQ==
X-Gm-Message-State: AOAM530ddv9yAfsB5y/WCY1ZdxcUJ1iBiwtxDoF9TJj0//YFV3brojhZ
	xUXVDrphy+Ov3cWNqc6GxwlxQtc9iX4=
X-Google-Smtp-Source: ABdhPJzP6RuvLFjU20H2PG1567GaG8/B+U9ZCxaQnE9gpZ3riwQ97C9SC3UHkFwm4W7diIY+IG7Xpg==
X-Received: by 2002:a17:906:e104:: with SMTP id gj4mr36909389ejb.358.1634649169355;
        Tue, 19 Oct 2021 06:12:49 -0700 (PDT)
Received: from roman-Latitude-3400.. (178-133-75-113.mobile.vf-ua.net. [178.133.75.113])
        by smtp.gmail.com with ESMTPSA id g2sm11334590edq.81.2021.10.19.06.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 06:12:48 -0700 (PDT)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	mripard@kernel.org,
	b-liu@ti.com,
	megous@megous.com,
	Roman Stratiienko <r.stratiienko@gmail.com>
Subject: [PATCH] usb: musb: sunxi: Don't print error on MUSB_ULPI_BUSCONTROL access
Date: Tue, 19 Oct 2021 16:12:44 +0300
Message-Id: <20211019131244.1568560-1-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Error message appears during suspend, where musb driver is storing
the register state in musb_save_context():
```
musb-sunxi 1c19000.usb: Error unknown readb offset 112
```

Print warning instead to avoid confusion.

Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
---
 drivers/usb/musb/sunxi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index f3f76f2ac63f9b..961c858fb349e1 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -440,6 +440,10 @@ static u8 sunxi_musb_readb(void __iomem *addr, u32 offset)
 				return 0xde;
 
 			return readb(addr + SUNXI_MUSB_CONFIGDATA);
+		case MUSB_ULPI_BUSCONTROL:
+			dev_warn(sunxi_musb->controller->parent,
+				"sunxi-musb does not have ULPI bus control register\n");
+			return 0;
 		/* Offset for these is fixed by sunxi_musb_busctl_offset() */
 		case SUNXI_MUSB_TXFUNCADDR:
 		case SUNXI_MUSB_TXHUBADDR:
@@ -494,6 +498,10 @@ static void sunxi_musb_writeb(void __iomem *addr, unsigned offset, u8 data)
 			return writeb(data, addr + SUNXI_MUSB_TXFIFOSZ);
 		case MUSB_RXFIFOSZ:
 			return writeb(data, addr + SUNXI_MUSB_RXFIFOSZ);
+		case MUSB_ULPI_BUSCONTROL:
+			dev_warn(sunxi_musb->controller->parent,
+				"sunxi-musb does not have ULPI bus control register\n");
+			return;
 		/* Offset for these is fixed by sunxi_musb_busctl_offset() */
 		case SUNXI_MUSB_TXFUNCADDR:
 		case SUNXI_MUSB_TXHUBADDR:
-- 
2.30.2

