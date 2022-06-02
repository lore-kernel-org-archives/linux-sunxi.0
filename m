Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ECE7F5
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jun 2022 10:11:16 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id rq11so9016836ejc.4
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jun 2022 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XP2MYhxOsKZps4QmlXxrybN7eWdufRzVMujwQeLYeiQ=;
        b=Y7onb5K2NewHqCE/PuGP/wM6SCeTA9lIvWKzv8jJhtUkxUOyaEHEvZiw4JImYrjs5s
         kN6M2jWBn/hQJ/gO0U4qlL+XEEZs8pBtfUQ7IuiVcWEY+wkFthPiLSsrRXsS3fAejXjf
         kvvCJdXMPDrXcvk9yeZZs+tpjZf5dJArjVjTut02jEijcVhq8rbRluqdP29ZKyXUlZ0F
         fJkhZe5RKIX9fdItmgPXHqlKhpZXFaipTO/Gruap1SOY4B/9/Ytjd2qjTb2u4T/Z7HIv
         oAhNBOBsbESgy+TS8gXxGpo9jSv+l6+EKeAQ+jf9dQdnk/13eCdBqS3ieLyeeOzv7xBB
         liEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XP2MYhxOsKZps4QmlXxrybN7eWdufRzVMujwQeLYeiQ=;
        b=Q0TiJ3tnAuxZONm1xkmekCzdP+dFX+O5LX7I1rJy5WohyE3JIYadEZ3XCvvn3butQ0
         KJZT/gNszaDu4Pxre7u3MHqq9F/+NIzNeqo8kyL6bfWjo0fqZAVHTe1oPdd3sSP+zfdu
         wDy89ludnv/cr2cLZERmmGtU6bBXlhbXdqxCcz+2JGXApOMRbQr2XpRUE2wZAyDYc1AB
         1tyOqI0m1gCA41mTb8jrpWEUKJSAgzDpYWWZDzUVn0re4eMTsP0jpSU8Wtzjmd03rOXf
         N7YMJBOP+BpbqwIJAIa/6uULNTUxVeod9TNe/9NBDBDcckKeBt8tLWv57OBNhDuLqWAM
         qkdA==
X-Gm-Message-State: AOAM531xhc4N2A9PGYxddpXSkSRGok/ZRtqscMbHFdzTQkuuC2ctZfi8
	vSlX2p80sUfJveZ8/8adEQU=
X-Google-Smtp-Source: ABdhPJxDXM6X2WzIbpB2ecG4Bo1W47SYy6zSGtMFLhp5s1cFEX36s9yh+wV046gKroqLIrujwyPa2g==
X-Received: by 2002:a17:907:3e8a:b0:6fe:fcb6:6d45 with SMTP id hs10-20020a1709073e8a00b006fefcb66d45mr3454512ejc.348.1654164674585;
        Thu, 02 Jun 2022 03:11:14 -0700 (PDT)
Received: from orangepi3.mydomain.example ([195.234.74.2])
        by smtp.gmail.com with ESMTPSA id kx16-20020a170907775000b00706e8ac43b8sm1599621ejc.199.2022.06.02.03.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 03:11:14 -0700 (PDT)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	megi@xff.cz
Cc: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: [PATCH] drm/sun4i: Enable output signal premultiplication for DE2/DE3
Date: Thu,  2 Jun 2022 10:10:57 +0000
Message-Id: <20220602101057.48170-1-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise alpha value is discarded, resulting incorrect pixel
apperance on the display.

This also fixes missing transparency for the most bottom layer.

Test applications and videos w/ w/o this patch are available at [1].

[1]: https://github.com/GloDroid/glodroid_tests/issues/1
Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 ++
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 6b1711a9a71f..71ab0a00b4de 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -320,6 +320,8 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 	else
 		val = 0;
 
+	val |= SUN8I_MIXER_BLEND_OUTCTL_PREMULTIPLY;
+
 	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
 			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index ebfc276b2464..bc12c95af6f3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -65,6 +65,7 @@
 #define SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(n)	(0xf << ((n) << 2))
 #define SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(n)	((n) << 2)
 
+#define SUN8I_MIXER_BLEND_OUTCTL_PREMULTIPLY	BIT(0)
 #define SUN8I_MIXER_BLEND_OUTCTL_INTERLACED	BIT(1)
 
 #define SUN50I_MIXER_BLEND_CSC_CTL_EN(ch)	BIT(ch)
-- 
2.30.2

