Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311F937FF40
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 06:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343138; cv=none; b=XvqAEq5+1OSt7ZJ/mUoZkly5wHvt5TpIBw8z9D45BNY5f4El9/4hJjTCQ1yixO4svViAyPhyTWkVxkmM7giS7fw2ed0gPOvPBH38COX3x8HTL6fAFYTWxGdFu3fcIDc1GCozTPR92bWvJEiPy0rZodbPHcNp+3RIMlGqwEmgK00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343138; c=relaxed/simple;
	bh=tDsFj4Lh9ROCK1QL6OxCscLJBiWTpO7vMwF1199NUaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r3WSBKvZq4slKKAxWVw8EtWbfohYJl+OJdmKjphyBlgzkZA0NwzVQAS6+KilDYmb0AMo7VVxZSQ8cevjUldeNvwX4Hcc01gc6VPOjBOTHtGI5aZk1Vdp6xqel2ORNk91YCyvd6RHd3p8PR7WfypxtUUxl0jIdPMLg9m0d3us+2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJMjgaHC; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJMjgaHC"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so664210a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 09 Aug 2026 23:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343134; x=1786947934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTWsfLJS/81iyczYbFu23mRRJqJRdNk8TSWy7ODIao4=;
        b=YJMjgaHCVk/OK8cCaecZSc62KpnT9RYT/MOUiEiNLSeUCd7YKteYjJ0mMihroubyHq
         LuGrbZ2izgfGe1ceELlRF/YFkKA8Rsjo2hpgKTLVt0e3XHv9tqPtxQs3QiNy1eJat1w0
         uoUyKhKfkjfQ9kxP2xdTafnT9TrH6fqCg/qL8G+2fjKi1LQj+Cf78w4wJC42ccN1h1Hv
         Bx96ZgmTKT8FJllWUbcJeagjryUZVXKFGWCMfYS2qp/5tukWZXv1bATnt25l3t0uZ+W/
         /SGrCiwaVp3czvaXcL8XQYCXcwpriiS1b9sPwIC6qKWWfUvBn8rX7ZJwPma2YJ9bYVIm
         hGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343134; x=1786947934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTWsfLJS/81iyczYbFu23mRRJqJRdNk8TSWy7ODIao4=;
        b=IkJE6FZKnTjc+4OCOWKNDLK3Z7SFb5MD+PyVGZccmvD5gqQisrYo4Q/qcquhmMB23i
         y8h75DSPo2F/V1UPpdCylVPOkEAwWRqGvvv1T8t25BTQT4KHhgmogI//lJ3sU/H5ENwe
         isY+kZv25XPrUOS0+uRrsEr7q3L73wPXYzVj2XjxtzS3q02uUGmdZ6G+BAvnNxCvSHq5
         m14WZElaEdPGQrJi9O4vwsiEc7IRRorooaJVPYHdd6p0rLGbho5rJUcpesAeMwij0Qpd
         H+SkisN0qEmwTNlmdrDwREWf3tNSuB2sf21/A7dKvVXBPVOvH65j4z7RNjd4nKAzyR7M
         Pw2g==
X-Forwarded-Encrypted: i=1; AHgh+Rr0etnCl08cIYQrsMPn/sR0lj8YxcOHTuZPS9DIewdMvJ9IN3nYvj4xQo5Dffjodk9plKxJPtCT8cFlJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbHUvU6XzBIzcVKtB0YQfR6kE4zjLyz6PL8NzIitwwEB3xPept
	SLGVRHvBTlnwQQBr5rMAnco4pQ3/JaI2B5ahmjkADdU+28iugrHFb+s8
X-Gm-Gg: AR+sD13lcueQjFr1wFs8LEZG7+YM6+dbhKd8YASlMOqRisg1mNzZYHgz+zCgb0HmghB
	folBKYflgath8CWqunKDjfmbCkp6MTFCippp2j+nUJIodPN7Dp8pC6bXR1MtrwgCKEmLXUlrDk0
	YnNJF/dQYyicKE4+DrfYrOL32oNbwW+penFEbUqYNUDN4USpS+36IR4WtX4AjKQzUeDvd750Cxr
	L8SolY7qFsi1Oy6LLGrwG17gl7OXORQ0ar4TGrEdnq/R9bDuwQxtLM2PTpvnzQdj3PvPdMhJ4U7
	fKtPnnWxtqHcBEgNhpg4x1fT7kEuT8yNhc/C08i1ndOR9xBjiz9BkdrgFBzRvFSyP6PqkpNchXc
	pnE4vjJ1LyxPGMrcXyO2DhjciEF5iFiznXvGpoZefPdeGwls1M5/R6uNSgJThF/CDl4EKlVfWYg
	IWFxDho0MK/DQUY3WeVdsXqOog4tDs5+5kx/z9HmxwWnCjcNAA4IXZD4vLVrwQAZeJszDp1jX7x
	q6xdA==
X-Received: by 2002:a05:6300:6d82:10b0:3cb:d156:d362 with SMTP id adf61e73a8af0-3cbd156d365mr11748055637.3.1786343134085;
        Sun, 09 Aug 2026 23:25:34 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm40642912eec.16.2026.08.09.23.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:25:33 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] media: sun4i-csi: fix video device and subdev leak in notify_complete()
Date: Mon, 10 Aug 2026 13:25:19 +0700
Message-Id: <20260810062521.1709379-2-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810062521.1709379-1-congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
 <20260810062521.1709379-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun4i_csi_notify_complete() registers the bridge subdev with
v4l2_device_register_subdev() and the video device with
sun4i_csi_v4l2_register() (which calls video_register_device()) before it
creates the media pad links and registers the subdev nodes. If any of the
later steps fail, the error path only unregistered the media device:

	err_clean_media:
		media_device_unregister(&csi->mdev);
		return ret;

The already registered video device and bridge subdev were left behind.
Because this failure propagates back through v4l2_async_nf_register() and
aborts probe, the driver's devm-managed struct sun4i_csi (which embeds the
video_device) is freed while /dev/videoX is still registered, so a
subsequent open() from userspace dereferences freed memory.

Unwind the registrations in reverse order on error, mirroring the teardown
in sun4i_csi_remove(): unregister the video device with
vb2_video_unregister_device() and the bridge subdev with
v4l2_device_unregister_subdev(). Also unwind the intermediate v4l2/media
registration steps so every early return leaves no half-registered state.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770b7..a8711336a754 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -85,11 +85,11 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 
 	ret = sun4i_csi_v4l2_register(csi);
 	if (ret < 0)
-		return ret;
+		goto err_unregister_subdev;
 
 	ret = media_device_register(&csi->mdev);
 	if (ret)
-		return ret;
+		goto err_unregister_video;
 
 	/* Create link from subdev to main device */
 	ret = media_create_pad_link(&subdev->entity, CSI_SUBDEV_SOURCE,
@@ -114,6 +114,10 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 
 err_clean_media:
 	media_device_unregister(&csi->mdev);
+err_unregister_video:
+	vb2_video_unregister_device(&csi->vdev);
+err_unregister_subdev:
+	v4l2_device_unregister_subdev(subdev);
 
 	return ret;
 }
-- 
2.25.1

