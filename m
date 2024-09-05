Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671FB17C9AB
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509877; cv=none; b=L6y4qUw3gg3m6Fnj5p+IT94KbLHzVfU8pc8qAUlUnORfdiw6xdDspqLx9a1UjDbkk3VfXcni4vElaSNjjqIRw/lXkc37NyAGBxUjG0Skca76e1BFhrUsJAajPdSmxKse+whexYQt+gk7zafmx8bz0868U3gSZ9j/2znWG1iKfJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509877; c=relaxed/simple;
	bh=YBqMCDM4+M0yOaTIf2DxfFz/daeISV5+YgDaRESvbI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NRwpXnPjsKQA3wu43UHOPxkCFyTzg9EawL/m46Lg7bIjtJjaz3zD5vr3oYVTFOoVZ1kgR3aB77dXqBZaq2StFt3Cn0nO7vDAJ7Fg60Ze+9mbWQnRTw4kLFdBmup2Ari/8+eFQd1YTqC1Cp1SadnN0rf1r0vA8mHMUKPYOcKD5bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOHVtq+I; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOHVtq+I"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-70f60d73436so217516a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509875; x=1726114675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mhjJvDJNhv2xHoY3ut/g1TUbMfaB7j2eg1v0tOHhm4=;
        b=LOHVtq+IEO5Z6qYZdL5DgY/550WRX6q4RzRmvlu8Wd6jfdC6WOBa0PlTdPX8W5PQgh
         2z5Fe3gDd5+zE9rqvYuMpE964imdDe60BU2SkpJFjFkkonuj2KUbeLfiDV5QzDHOUXQW
         tJfKDRXsj0u+3QpDwI1Pj93nXZr2uW+aswmDGMpLxeyan+sjnME1gLaNQ250rg7IUK2A
         X/hXW/sEYkIs/vepDDfYJ2BIkGTas3y/hsRD6YFgD8auuAMc697zma8hfSMMWRO1x773
         2pAMtU00ul5QSstAq+kIzZYnjQqTUXDpG8jwKWoOVZIVy/bx6fd5EE7ZmaRqBUnPabYZ
         7V1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509875; x=1726114675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mhjJvDJNhv2xHoY3ut/g1TUbMfaB7j2eg1v0tOHhm4=;
        b=FzLuc8sucdySZf4jc/jUnovqC2RRJ0f6d1n/2BE3K2Nj0XXN2TDRfUSxSe/cyjfOoT
         BKK+AOLwqghrWGZmRQtZVVSn58mluoJMwZZhic7gbPj++Xdru28z8zPpvQzQH/gF9vw4
         /g2663nyYDPbupE9V6CuvhVIAjtsDlpg0jHIpuPfoLjeprlQQ5TMe61FNwRMIFFCCav4
         9FkoveK3mY9ftjQJrPXO3i9QVB3fw2T0eZuy+5pFUxYIlYJFbwXy0oIvGznLfWwcwc1I
         d0D0OnlCYAaiyDzCEl7UqEld5A6mNEXL0aRPWecI6rP9XFxTLvlGeR40TXugSjUySmha
         KGKw==
X-Forwarded-Encrypted: i=1; AJvYcCUq8XLiSwhea88+HMU4/ozw8M4fLkJIt17U9Z33WW/wk3E3LkVN3cyWmiQgSr69wmcri5Zptd1Dv256eQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAbXSOzyNuz9xEBmYKjrndd2ZCvXZ4JRS7qH9lMLuzR8A7JNVS
	CR9BGT0TtxjD6k061yXvenfT9XbieDHF+eXkpMiaTZDCqKXKU0Tn
X-Google-Smtp-Source: AGHT+IH0JYEg6QtSOGjiEfpDAKUS/a7YvjIKxseySaiP7VkfsPIL/Y4j2nA5ofHv3vaP5pULVvdK1g==
X-Received: by 2002:a05:6359:5f9e:b0:1b5:a36f:cf52 with SMTP id e5c5f4694b2df-1b603bee046mr2609562155d.2.1725509875510;
        Wed, 04 Sep 2024 21:17:55 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:17:55 -0700 (PDT)
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
Subject: [PATCH 08/24] Input: synaptics-rmi4 - use guard notation when pausing serio port in F03
Date: Wed,  4 Sep 2024 21:17:13 -0700
Message-ID: <20240905041732.2034348-9-dmitry.torokhov@gmail.com>
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
 drivers/input/rmi4/rmi_f03.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f03.c b/drivers/input/rmi4/rmi_f03.c
index 1e11ea30d7bd..e1157ff0f00a 100644
--- a/drivers/input/rmi4/rmi_f03.c
+++ b/drivers/input/rmi4/rmi_f03.c
@@ -61,14 +61,14 @@ void rmi_f03_commit_buttons(struct rmi_function *fn)
 	struct f03_data *f03 = dev_get_drvdata(&fn->dev);
 	struct serio *serio = f03->serio;
 
-	serio_pause_rx(serio);
+	guard(serio_pause_rx)(serio);
+
 	if (serio->drv) {
 		serio->drv->interrupt(serio, PSMOUSE_OOB_EXTRA_BTNS,
 				      SERIO_OOB_DATA);
 		serio->drv->interrupt(serio, f03->overwrite_buttons,
 				      SERIO_OOB_DATA);
 	}
-	serio_continue_rx(serio);
 }
 
 static int rmi_f03_pt_write(struct serio *id, unsigned char val)
-- 
2.46.0.469.g59c65b2a67-goog

