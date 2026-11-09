Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246681;
	b=De4KBj9zde04feAOBjJ13dT7hddLR1WsGQArehGLB74PrpBVSjynM6aC24Wf+apPvUsa
	 6G51g+akDCpCtGh4S6gKQzDm4vWTVdd+rxvicKGTyQaEiubkH4FXIMuU4+o+R7nutSwG7
	 +yIzLeVITJAvmBA/WB8ytSyTrzeSieagyR4HExAaZjtYv1bsasSbp9od0ub/WYAKFbDJn
	 /vywbzQUaiP28wANH1tJ7mYhzBW+HgzE9YYiTqNcC1H4s7GLwBREbyYHroiL/Knjsqy7J
	 PunwgToTai0Br6xHY+ZbnSuLCUCY15yZUoF7XD/5HsE4JIDbZdGVhPLQJ0+XMDRJeGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=;
	b=4VZGuY19cW7Dt/gVnCZtiOky5kNf8QXsN1aW5AvkDclDW9yflRH2tFiVqg1QvbFViXDv
	 9qJ4AVogEo9DzKjnq1TE5WoiaUItalyo2Ukav3HlrK78WmSIbaVRXbqoWmepysZsKy2OM
	 2JU1477QECHFBkE/kZH8Md4q9BSzII1bO2RNTVdswdthTqUKcC95PoFoQ4YeQVB8YgkQQ
	 KmPOwdonGt00r79nZahwvklTP1+NxC6jW/z6ywWCImV2vTIeqI9H7Y4OotokV8405GDaM
	 ubEEirtZxOqRb8Jq3SlwYl7zDwDi+R+XpQHUk0C1lzs4Qh1C5+EAbkTjPt0ncWBPS+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UUC6ciMV;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3351860A6F4B
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 17:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3351860A6F4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UUC6ciMV
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so11956445e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 09:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246679; x=1794851479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=;
        b=UUC6ciMVk7Hl7CqXrQOqox/XXghALwlSNC7hy+w5SCL+d3qBS0x6H7UyJ4Aas+BqSP
         94o6BO/q4S026KI0BCAoy6awhzjfVyYQXMQ3RsmiKA5gcJKZjk4+URvYSideIDwH+7R0
         zzJo/DI/IRwvtRk9GbL9fa5F3HgTDjH/jNx8IvND60SHc+DSXEF4bk202N7wAQKZfipg
         asNRFi7Z5bchDRCjAwtqhIQ3aTDNAVr4qR/XsKarnrY+j3eG92sKBNbG9rp/vony+3J8
         SSMR6XxQEBIbHwuYuMFOe0/ejNEUMpy7wb7j3y6wsbzFq9S7oCNATiCp/xju+4vAfsNs
         jnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246679; x=1794851479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=;
        b=e30lpAIifN1296baxFztg/swxKEQugwNP192E1liDacJjtwMjZUJRdjBQ0luhF8wGG
         FbKnKATxFikVPqx7mCvPcPtkxPUB5nCBHJRcEO6/Bzd1jD3+yaKQDWenYTM2M6/nmalx
         lfmoKZ1D/FDmkE09Edy+6Jvona3IPpA0Z/x2W2ui7/tz115K+Jh+fhKBQlmFQ+wjjZm5
         B+DYfB4S8pRiOcQQUmnVLZMnmcpYhOYPptywKM7FJcJB5wvQB66U1kwnMtIIRAM6gMAp
         R41Fn5p605NPYebBmzn+SNlI3ffuMmG4tM35lALu0E0xLSx/Xwb7oie9zEzKiS7N0DZY
         QNjw==
X-Forwarded-Encrypted: i=1; AL+hErE/63uy0xDAn1mZGqB9jqUZfWSIhyAPoBqMRGPhUGFoDVvSfZuaZq01hqtHdBrCv36RqRCJLSG2kEKqFw==@lists.linux.dev
X-Gm-Message-State: APuU4Z++e3NR4sggL3LxBNaeTe/kAY47EVTf3AeQuWYX7+0iFvNiKukJ
	Vb4mC0Z7VklyM0TbPNCa20Qpcg0nlcDdJI+cmHLD25eM5QMVceHYxT8t
X-Gm-Gg: AYBFou3LVYtdnPY+JCIg10XZClVoL6ZFR/avnFlPLkLBcFUGCH4bGvacaRTux2B+P3E
	/g9rxveX67er/v9xm6mZPo83b4WfEHcwhN2v3VRM3GaPx/k948xFfZ2qYaH0iIcSfYR6fdUORW4
	0RGp7MNuzbW8C7LwhifqB1nCNSehbF2ksN5zLrZdQ5LFXhCSlifFd65h+SFG5hryGGaqQc+arhh
	SoQteSdkU5+I73/bYNHq6jsyXvJWKTxyUmcoZOAGAzBvdYpzS0a4J9f+7CYxI2Zw+QqQWN6mHg7
	gVGbAOmCbe57RjQzC8JVx+SZJKkaHbxiO5th4S28MGX7hkqGnMqvfDHrgqN1MVXDL9a+uGNoyAZ
	eF5Zvh0JaSZ6MqJ7Gqq40AoJMWKj97mxpTphROvTDa1/CBUYgm5zsZLx0kTRPGkVErV2B1WJst4
	ICCw5yXN80zdYwDW0p2pIv9lt3v7Ff2totTmeWSebLcZ214cXlyxsFx9jySeS5KZV+WNu2aVRKz
	UZNt2P++sPV2ITDm4gJ0b7Kuaa4l7U4WLyfCCcR9KpKbiX8SGrlMWeYQvs6vvkpyl8giQihaLkF
	4/+akCHULt/xkEpVeMCSBBHQ6kcWeiQHRL4bG9Tk1Sw9pqxUm6LeySTw7e0jq3gWjs6LFxpGW48
	5I0lK1b0hEdx8cn+u1ZlSywCAhs0yWEUe/4AiTjoxYcj8BoB+lLX0HyklgCPAv+jHsN4Hnr/JRz
	ZIuJ5oFYqriMP98d0Ew3I2YfpQjvSp3/AL2ncJ0ZZqYENDg0JvF6SweXWuHCzMGyeXqAu5dTwvq
	67/ycEvA5ew4g+bBfeqEYaNFMSfqH7igGt6lmMFfxiOGAVlXQxh1LNHHBW5jDzMBPHcH931
X-Received: by 2002:a05:600c:1c02:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4ba0230cc8emr216685e9.2.1794246678645;
        Mon, 09 Nov 2026 09:51:18 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:18 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 10/11] staging: media: cedrus: h264: clear the DRAM buffer sizes on start
Date: Mon,  9 Nov 2026 18:50:15 +0100
Message-ID: <20261109175016.42061-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Above 2048 pixels, the H.264 decoder puts its deblocking and intra
prediction buffers into DRAM, and stop() frees them when their sizes
are not zero. start() only sets the sizes for wide pictures and nothing
clears them, so a narrow stream after a wide one on the same file
handle frees the buffers of the wide one again. The codec data is also
shared with the other codecs, whose data can end up in the sizes.

Clear the sizes at the start of start().

Fixes: 03e612e701a6 ("media: cedrus: Fix H264 4k support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 97958ceee8d1..e7a3bfbc3531 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -573,6 +573,14 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 	unsigned int pic_info_size;
 	int ret;
 
+	/*
+	 * The sizes tell stop() whether the DRAM buffers below were
+	 * allocated. Clear them, as they are only set for wide pictures and
+	 * the codec data is shared with the other codecs.
+	 */
+	ctx->codec.h264.deblk_buf_size = 0;
+	ctx->codec.h264.intra_pred_buf_size = 0;
+
 	/*
 	 * NOTE: All buffers allocated here are only used by HW, so we
 	 * can add DMA_ATTR_NO_KERNEL_MAPPING flag when allocating them.
-- 
2.43.0

