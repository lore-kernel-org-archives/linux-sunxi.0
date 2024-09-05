Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387FF155342
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509869; cv=none; b=t9fc2CFVaW8AQIaRO1lF7iBhvwHZFcGjzcP10Nnz78oWmcieIKwugHO1XMernGMEVnbEK7smFI7AfaEDEnq8EQUt6MIrxihqKlWXLdFVNdSvZcWdi9gPUJxj/Vbq9C2PmcGMtWOP5Gp4QkLEwnaVGqG+0DrNGy5oCBiNIPr9TRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509869; c=relaxed/simple;
	bh=lhvjV7Fn/6qUD++5apj3ZBU0dququYNw1dir73W7S1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBfxQg3kqWl6+6n1NpNEoEGt4ATJg9esBFIHCNWxVSHueL2ej4Za7FiSrsfFmZJSP1Jioub+FWVkFMatgqt26r6bQrN5xM/P25paLna7XMhdQJTpsImyuY29B8zvgaFyCtK97AwVkSYj5Zx+CYaLPLU41sjUykV/pyhL8W29q9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5ugDrvB; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5ugDrvB"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso417667276.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509867; x=1726114667; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YscGpXPa0igYUdPp8o8oV5VkpUTxqWDGqD7B4LMXPvo=;
        b=c5ugDrvBODPajSDaWs0Jv04lE2xDg1BDanV55FzsX7rV27hU+pAL35YPj3i1urI40G
         VPqn29A6f2Gx13nFUaQaYnIHIkrb2in/rRmzazSQJKjxodWrws5m6zrit5hkClX8eWpx
         FtLb74nxmLvlUEFWwSGz2yNJ9BUxkoLzOIHrBicrkK0rD+dqspnrGmNzRcttfMURpmNA
         mRG5zPlro9kFKORb2BkD43wxJGHtp+bGc/x8qrpEn6PrXWTjZmgAgYB9Qj4az+TqWWFz
         Fg8HsPcCV5SkIOr3Pp8A5eokDna3xVsi9pUXLtz26wsMeXf2MBEK+sIRfa1405WT39Qa
         YZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509867; x=1726114667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YscGpXPa0igYUdPp8o8oV5VkpUTxqWDGqD7B4LMXPvo=;
        b=XYOi00VHMsEhNKpbPD795AAWfk7SW/5ghf6yKoALJAQK9hGfm2HWKITOEwoURja7Vs
         9IYMoUGnaj/TiDmHWn2CzL3Uo6wTWl1ot5CUXqekSNlfn5wC65EBMFSIydwxiOBhdEDC
         jgHJv6FmHousD9PwcpsXcjTD50AUvRH03jxnnMLt+4bZMZYfs6QV4+mnDXi0fgfCE3oF
         zYSyRv+gepvrZJQWeCSzKnPdWCfhu16WLfMJcCCfXgDEubysLbTaSGatpaE4Xeaift83
         S0oFfNfLNm2Ewa3c4JDJ4rIn1pFCo57u/6Bq5ZRkjGkpqeqYedT9AnLiRaca7yHTcG7j
         g7Kg==
X-Forwarded-Encrypted: i=1; AJvYcCU65BqjLZbCaQoMzsBH+4A0ytIGiyiR1tacNkMCEauWAXjf2AxZ71eYEsi4ItsU68Ru7r5aiA9+q+sckA==@lists.linux.dev
X-Gm-Message-State: AOJu0YymPFmmH7nDmH46KrqGjJTxtYMY08y9+0JirFMPjyv+f+AApw45
	Kgm3bhHVU35h7PmJ5nU+DFswGk3weKhjJMAv0WuTXudVebJawDiX
X-Google-Smtp-Source: AGHT+IG2n4QttKo2Kk6OwZ6xAkRc+KBcDbR2JtYsfVRI0Ayw5MYcw6SGH0iMQHCRmBjRsLLZm2riig==
X-Received: by 2002:a05:6902:1106:b0:e13:d834:604f with SMTP id 3f1490d57ef6-e1a7a3cf59emr21411841276.50.1725509866951;
        Wed, 04 Sep 2024 21:17:46 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:17:45 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Helge Deller <deller@gmx.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Samuel Holland <samuel@sholland.org>,
	Lyude Paul <thatslyude@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 02/24] Input: libps2 - use guard notation when temporarily pausing serio ports
Date: Wed,  4 Sep 2024 21:17:07 -0700
Message-ID: <20240905041732.2034348-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240905041732.2034348-1-dmitry.torokhov@gmail.com>
References: <20240905041732.2034348-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that serio ports are resumed in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/serio/libps2.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/input/serio/libps2.c b/drivers/input/serio/libps2.c
index 6d78a1fe00c1..c22ea532276e 100644
--- a/drivers/input/serio/libps2.c
+++ b/drivers/input/serio/libps2.c
@@ -108,13 +108,11 @@ int ps2_sendbyte(struct ps2dev *ps2dev, u8 byte, unsigned int timeout)
 {
 	int retval;
 
-	serio_pause_rx(ps2dev->serio);
+	guard(serio_pause_rx)(ps2dev->serio);
 
 	retval = ps2_do_sendbyte(ps2dev, byte, timeout, 1);
 	dev_dbg(&ps2dev->serio->dev, "%02x - %x\n", byte, ps2dev->nak);
 
-	serio_continue_rx(ps2dev->serio);
-
 	return retval;
 }
 EXPORT_SYMBOL(ps2_sendbyte);
@@ -162,10 +160,10 @@ void ps2_drain(struct ps2dev *ps2dev, size_t maxbytes, unsigned int timeout)
 
 	ps2_begin_command(ps2dev);
 
-	serio_pause_rx(ps2dev->serio);
-	ps2dev->flags = PS2_FLAG_CMD;
-	ps2dev->cmdcnt = maxbytes;
-	serio_continue_rx(ps2dev->serio);
+	scoped_guard(serio_pause_rx, ps2dev->serio) {
+		ps2dev->flags = PS2_FLAG_CMD;
+		ps2dev->cmdcnt = maxbytes;
+	}
 
 	wait_event_timeout(ps2dev->wait,
 			   !(ps2dev->flags & PS2_FLAG_CMD),
@@ -224,9 +222,9 @@ static int ps2_adjust_timeout(struct ps2dev *ps2dev,
 		 * use alternative probe to detect it.
 		 */
 		if (ps2dev->cmdbuf[1] == 0xaa) {
-			serio_pause_rx(ps2dev->serio);
-			ps2dev->flags = 0;
-			serio_continue_rx(ps2dev->serio);
+			scoped_guard(serio_pause_rx, ps2dev->serio)
+				ps2dev->flags = 0;
+
 			timeout = 0;
 		}
 
@@ -235,9 +233,9 @@ static int ps2_adjust_timeout(struct ps2dev *ps2dev,
 		 * won't be 2nd byte of ID response.
 		 */
 		if (!ps2_is_keyboard_id(ps2dev->cmdbuf[1])) {
-			serio_pause_rx(ps2dev->serio);
-			ps2dev->flags = ps2dev->cmdcnt = 0;
-			serio_continue_rx(ps2dev->serio);
+			scoped_guard(serio_pause_rx, ps2dev->serio)
+				ps2dev->flags = ps2dev->cmdcnt = 0;
+
 			timeout = 0;
 		}
 		break;
@@ -283,6 +281,10 @@ int __ps2_command(struct ps2dev *ps2dev, u8 *param, unsigned int command)
 
 	memcpy(send_param, param, send);
 
+	/*
+	 * Not using guard notation because we need to break critical
+	 * section below while waiting for the response.
+	 */
 	serio_pause_rx(ps2dev->serio);
 
 	ps2dev->cmdcnt = receive;
-- 
2.46.0.469.g59c65b2a67-goog

