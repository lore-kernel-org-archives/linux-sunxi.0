Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A7F1386C6
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509886; cv=none; b=l8eX2WduX6p1eBOGz81W5T3LSWyTsf8heYdDSzeuQNxHCVhyL27geMOkudHqVY08zJb88jL5nUv9w3NUim4B8sxAtz/QMfmivL08PPraH2MQzLThjdKva695WX5sALiMsa4sbrOpfmvgO7FDOuyuUp220zyG/NIExLOJS1PpCdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509886; c=relaxed/simple;
	bh=6OZz/CQ5C04CYHdb2al2sR2aCuKWbUvrddF0iZDtVw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXHHTpflfyGAMSsRI37UbI+S4hyuZp3uiUOSMamEby7p56Si9Gf34+BRaUGB/szehF7FfLOws+EpKNPwNIuhs3lC41bL2krx53zvxlxTPMUi8qb0hkXR31LmzrdBNZFwxJlIOZmjGyEbF494LsTEHsA7FE/HXfCvHx/58zni2Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnBkV+vb; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnBkV+vb"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-70f645a30dcso287381a34.3
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509884; x=1726114684; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3btFCntery0ta6nV0jjerZVdR60/Gk5jQnmpE6Mqz8=;
        b=OnBkV+vbO+GBG58QT7jrzceZ11fTzpELDDaXVi8ZpoOVNbDlHaw0PCaQ1r9gUrk5E4
         BXJ6bop5+qfNGofAs3Y2+5vi1jg/5YxyqvmsrTZYcAZnUx5zEAADxGSjiI/+hKPgcs1z
         rNqcj8dQ/9I81v4WhqfaPNkQR3mgbaOBdkVSyMl9k8T04EuE9XNyrqTokN7fFTL2HINU
         VwRm8J04Fd73ffCrxVKTL/HQw0u8TwNlWLM6WZyaRS++2f1TNPJAPiUTvxTVOIIaO08k
         evdiyMMXbXClT1YIldN00GBB062MseW6kWE8VlqpzEL/dyxuUG7CIq07RppdUlvQpT3S
         +mVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509884; x=1726114684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3btFCntery0ta6nV0jjerZVdR60/Gk5jQnmpE6Mqz8=;
        b=LXnX4viaup6lppPi3EM0UQ7NNzJKUgLI67o8JYlQf1iqhLMVVmHIfxjNJlE0nqHDzE
         duHA/gAv0vSbr2OIHYjul6vvD7uEf0VK/i1N8Ex3/Ea6Bq52szk9l2TuBxOw/HrVrErl
         pR60bMMeNY7DacKvlu1BhG3xN/WtrPR5K76iIXGZ32yBWEcH80nXcwDb3rXs5m2qwDkT
         N/CT+6FAjWGoV1EpL2RN8w427lOmn3ZY/jJ4Pbz2oJvT0cXmfEDsewCZkNb54KBWT2Ei
         NdEXZ8hA1v5hihMbWL+MC9ZDchpX5SJaow+CC1duq8AQ9DagWc2nMYOAhRtKHwWulVJO
         Z7fA==
X-Forwarded-Encrypted: i=1; AJvYcCXa8qqK4Z8Z/SamVi9ccAiT1nbby99P5K9VGAmLgM2fLDW1iNkKvoEyVoeirTRG+3ojcLmvQdQgZ6Rpsg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/BrYThDiCHhHrDJyeyLthCy+lN7jYdte80ev9M2k8vPZzAMVK
	EzF5p3mh44857PM/Og7U1dXfJMU6YduMcx9G8OmjjsavcopxDUhR
X-Google-Smtp-Source: AGHT+IFL+aSox2tT+ROcWimEdBXmALGnwGMrd8DuDbiXAmTxOicOS1tEjKJAt+iSvmj/V84cB+BBpg==
X-Received: by 2002:a05:6830:349b:b0:709:4793:8757 with SMTP id 46e09a7af769-710af68fc2fmr8717442a34.2.1725509884434;
        Wed, 04 Sep 2024 21:18:04 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:18:04 -0700 (PDT)
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
Subject: [PATCH 14/24] Input: ps2-gpio - use guard notation when acquiring mutex
Date: Wed,  4 Sep 2024 21:17:19 -0700
Message-ID: <20240905041732.2034348-15-dmitry.torokhov@gmail.com>
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
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/serio/ps2-gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/serio/ps2-gpio.c b/drivers/input/serio/ps2-gpio.c
index 0c8b390b8b4f..c9c382989e55 100644
--- a/drivers/input/serio/ps2-gpio.c
+++ b/drivers/input/serio/ps2-gpio.c
@@ -133,12 +133,12 @@ static int ps2_gpio_write(struct serio *serio, unsigned char val)
 	int ret = 0;
 
 	if (in_task()) {
-		mutex_lock(&drvdata->tx.mutex);
+		guard(mutex)(&drvdata->tx.mutex);
+
 		__ps2_gpio_write(serio, val);
 		if (!wait_for_completion_timeout(&drvdata->tx.complete,
 						 msecs_to_jiffies(10000)))
 			ret = SERIO_TIMEOUT;
-		mutex_unlock(&drvdata->tx.mutex);
 	} else {
 		__ps2_gpio_write(serio, val);
 	}
-- 
2.46.0.469.g59c65b2a67-goog

