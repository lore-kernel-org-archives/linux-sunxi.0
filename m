Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5571444B687
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 17:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519548; cv=none; b=RedsDFAq2dNPKBSFiKbm9r7g3cw2MytVBWEHfr5Ctfb/QZCpo7SAhfzYxpr6HrRQGoCwwE+K0nSuNWmsxYyxlyXCe7t3coZsefrp3PTLNQ9koo+MGInXNwcRtE+G95+UuvBJExxKTgAAQaNIfWIyDWrcC4X3gpFy+C9TTsf0RxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519548; c=relaxed/simple;
	bh=EB/e87XuFCPUJ72NiJ6scGbM1z6scuWykz1rqgsY/mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJjiWljXFUGehnEGXlqjWgH13CUCo/FLgBlTEfbfAJ0i+ijntEi1tuyDYbqJ1AdFFFJic0otQzVUERvb2mqS+n47yDrQZVUaQZIhW2WxMAouEkVfd4qpDkWVbVHso7i6C+ixVCKIF7+o673tjWinM+C6ybTm8SDJ6d9JfGesDdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JI4BQ0p4; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JI4BQ0p4"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a865d1547aso5116407e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 10:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519544; x=1779124344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxqdxYVfNyLoxNKHswDJZT0z/g1AEcUqUWKcspgGBc8=;
        b=JI4BQ0p4tJ9YR4hpCJ8Rk6jZbcjfGwA4Kd2wnLyMiY55VmU7PxlQmTQQxlOqDtlD/r
         WvDFS+Yfb9iterbha49s5x3f+m2TCKCZ4hxqc3QzdjaM5x8syzTl/Bmqr6sEImoxp2kh
         aLXP1g5xfy4dmRLnsTncD5RCVc5X13pq6TlHKFIKMt9VRhGWmzwS+arIvKhVwfYwZ32J
         Qsbbit3mQstKU5YgKfDb/mwMw9eY89SXCIaLXhkyp/RjVSof+PueSydg+0WA7eZKBmE0
         +iKyb4y/2ZBo1Bdl/Wgkte3x5/t1/9okElVH5103Sd6UQ4x21QLblc0ACME9LrxktYSm
         MkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519544; x=1779124344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fxqdxYVfNyLoxNKHswDJZT0z/g1AEcUqUWKcspgGBc8=;
        b=srOoxJUKw7toNXUb8XHsUupArqa68xVPD1gWAtbhVVxtbszmNITcibEVL1/RI11I5y
         dczOQHejumcjWhgHatxRMXQp1mbtaLtr+6aaSQheB5UCV5hoRMcDbewpkRTFw9TD9D21
         Xt0J0zyXzOt56+ojQFLl8b+DyH/fiVtW9RT9EvBMs5TiwtetgxJJL+d+46Jqblz5vkSV
         zdGYr1kdrlu6wkEoXVMhPzU+UDo5bUHe8HRETePsEmraL0hmCbDKWKt3sqxd2kpGDToZ
         R0gyISoRSHcf/Mlp76v+WU9NUzcnOi/60lgIM3zYvGMuSWEngdJ2sy/IsK67iaQpKVqz
         38zQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EnrialZf+hPPs9AGJPPw9Q104PYrK3n969QBgj5Tg7VaeiUTHOki+6gIj1K5E82PsSU9gaDeDTp+ElQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm9ePsYxkTxNFHhVbwcN7k3Qyr6uzYjnGRv7t30il1wTWfNavG
	b15WII8/O90HOXJi7isYHZUys0c1iZ0Zwhf6ZMbV1wRw7wXhszPm2/y+
X-Gm-Gg: Acq92OEvfTqETxUIR3DTo1EzWHsa6rCD7E0PxwSjL3JL0WKeABQ1ThNWxXxdnilSjU9
	iYFIFiSBtPjaqjmrqaoH/T+4+3mdsqZzkBnsfOn0AuqfZGs4sct0SlcSjnTXKvV7p/+oR0J2alq
	6g1t+ccTIKoYnHShNkcy18ihsQZqUgaA6rZE4BwaS/3i9lpk2WUir+cUicQZ+yjI1u7dTAvlroJ
	reTyuh8BPcPKGGtu+YZg6tGfd2MNH15PpslM61Jytk9qWGRxfd1WDWMHxCPmzP0s8IT7LGy9Kpw
	S8l2cY6GevEQSsS7ReIw4JAKc9fkqSYeG/Z4NCl6hEElo64eO4gBNSRcys3NcRIx9WrRTnfQ4CR
	4x59GwCvLLITkL80851PAtzT9cYl5Y+ieFbPTuex3gIXPg72ybDZezluYut5CzB1GtP+BgM8BtT
	D9ZZ7POeq4xKiC7gPE9uKU1vZeyKVcD+PAFQdR0czZVbEFCVJLoGDZtQE9nBwJ
X-Received: by 2002:a05:6512:2309:b0:5a2:b86b:56c2 with SMTP id 2adb3069b0e04-5a8e0f35137mr91615e87.21.1778519544242;
        Mon, 11 May 2026 10:12:24 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:23 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	hansg@kernel.org,
	hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	sakari.ailus@linux.intel.com,
	mripard@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 5/6] media: stm32-dcmipp: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:10 +0300
Message-ID: <3b7c3d1be61bcf092484016e25e7b8add98bbe0d.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1778518085.git.vebohr@gmail.com>
References: <cover.1778518085.git.vebohr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vb2 framework hands buffers to the driver via buf_queue() before
calling start_streaming().  If start_streaming() returns an error
without first returning those buffers via vb2_buffer_done(),
vb2_start_streaming() fires WARN_ON(owned_by_drv_count) and the queued
buffers leak.

dcmipp_bytecap_start_streaming() returned -EINVAL when the source
subdevice could not be resolved from the media graph, before
pm_runtime_resume_and_get() and media_pipeline_start() had been called.
The remaining error paths already converge on the err_buffer_done
label, which calls dcmipp_bytecap_all_buffers_done(...,
VB2_BUF_STATE_QUEUED).  Jump to that label directly: the intermediate
err_pm_put / err_media_pipeline_stop labels are skipped, which is
correct because nothing they would undo has happened yet.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c   | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index a42f43d19f9e..f0e809458489 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -401,8 +401,10 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	 */
 	if (!vcap->s_subdev) {
 		pad = media_pad_remote_pad_first(&vcap->vdev.entity.pads[0]);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			return -EINVAL;
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity)) {
+			ret = -EINVAL;
+			goto err_buffer_done;
+		}
 		vcap->s_subdev = media_entity_to_v4l2_subdev(pad->entity);
 		vcap->s_subdev_pad_nb = pad->index;
 	}
-- 
2.51.0

