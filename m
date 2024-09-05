Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4931527B4
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509873; cv=none; b=BbIRkA0NBX6dFjww1IoQBEYwU+g757x7IXEG/SGKZc/nbullPjv4as+BqT0cjUKKpPM9VYs0pqOGG8l7gVxqX/kfPq12ihFp780Xh0QMq7Bs8CL13o3j1OUfuNtNoTr9XOIHHCTa8fbjeFE8pO/7MkzhuOicF07jgYxbTtagXrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509873; c=relaxed/simple;
	bh=GTMszsxFP3FUMteNDzoBJGZ+be0o81i435ERu6zYnMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=celuRdjzUlImffjVhoggn93pTDKBtqZoG1RcduYi9zmaX8sEw5JUFyey/1fTd+0JypjgWX6TuKikYzrldulBdOJxlJni6ekaxgrSsvayuVtJ4sjgEDuK1RImqJwke24/BaGyvoEo0tcI7EgXxufb2szvqYTwVP0pNSLX8eBBkL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvFiSxCB; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvFiSxCB"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3df07fe03acso184743b6e.3
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509871; x=1726114671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0EXapSSsCRGMYSuYgIhJLIKriJqRLmvnrfU3aGsX6c=;
        b=JvFiSxCBbxegDjag8C1PapE+UbdbE1BxjAIlD/KaD1N1u2o2QifV85WAnzctIKJ1Vm
         IkJSDMH5sJSolj81LhtEsQUqBnsbfCuzcH1zofIIeJRmSKOz9lrFGeE7XvwNKsOBGOnI
         mQv9SvPcMPw/eypR0liKtXuX7Vb/5hpSBBHY2CCkta+/jFLkGZPXEppzdw8Q8vLy5nlZ
         MDnAIyacLzQV3wr0AhjlHf7ZwlNlQAKTSWU5WpQ+RbEb9ssM+4QmVhSBfc6nFn8iU2lR
         Ll4PPNUaVey3vt3kkzBIW1A/4c8mZSWvKzvoybteAgc5pvY0ACNwUgXplnNmruF7zDio
         i+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509871; x=1726114671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0EXapSSsCRGMYSuYgIhJLIKriJqRLmvnrfU3aGsX6c=;
        b=gAZFLn5JgwuyXiwcJ/odK/0eFryOqJjog/CC065a/xE901aU4sY+KQ9XrXxRoiPjr1
         Bgdr2SAFVI/bt/lINQnJA1MKumttN4db6GE+t4kZGQt27pLG3k0zv+N/o0u/yCcP+qey
         NKCwrQum1YM7fIWBvabrXBHXiU1x8js9+mQ84knVSXopflAh7WZuihhDMcBN+/Tpr8wd
         XioBIl2vJB2HZX0ucZknU20uNY9jugE+wiBepM4vBrrfiY4lh/o9QDCP94dNiJ1PKZ6w
         wBoNEXm6FWSfe5z20N5ujvqyYRP8woPwsUKzaOC5zkXdiOG0UuR+Rft60RvuOhPIngxm
         ynVw==
X-Forwarded-Encrypted: i=1; AJvYcCUp3M+6f3msJB7K9KB7aa6Q1ix3tBCRwvzyt/dAHMJBOqJB2Ya5BYiGLca+ldOx5Gz+Pzx4cth2LwgZpw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwROH6YtqvvyiYSfD8QGVGQfMXJHTOJucsV/A7ArDYz2FbmgvOO
	L9DdKy8NY/DlMP3Itp7t2orTzJZUybYdPaMx4r+leiiWnd40CuUJ
X-Google-Smtp-Source: AGHT+IGhPGvVxRbF3Iu8u5rEKkCm3Ue+quK2XnAYIQLdPlMcym1uORvuIvaEIla7+lCAvI2New5hng==
X-Received: by 2002:a05:6808:3197:b0:3da:aae9:7182 with SMTP id 5614622812f47-3df1d5b87b5mr19628930b6e.2.1725509871047;
        Wed, 04 Sep 2024 21:17:51 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:17:50 -0700 (PDT)
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
Subject: [PATCH 05/24] Input: synaptics - use guard notation when pausing serio port
Date: Wed,  4 Sep 2024 21:17:10 -0700
Message-ID: <20240905041732.2034348-6-dmitry.torokhov@gmail.com>
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
 drivers/input/mouse/synaptics.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 380aa1614442..2735f86c23cc 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -650,9 +650,8 @@ static int synaptics_pt_start(struct serio *serio)
 	struct psmouse *parent = psmouse_from_serio(serio->parent);
 	struct synaptics_data *priv = parent->private;
 
-	serio_pause_rx(parent->ps2dev.serio);
+	guard(serio_pause_rx)(parent->ps2dev.serio);
 	priv->pt_port = serio;
-	serio_continue_rx(parent->ps2dev.serio);
 
 	return 0;
 }
@@ -662,9 +661,8 @@ static void synaptics_pt_stop(struct serio *serio)
 	struct psmouse *parent = psmouse_from_serio(serio->parent);
 	struct synaptics_data *priv = parent->private;
 
-	serio_pause_rx(parent->ps2dev.serio);
+	guard(serio_pause_rx)(parent->ps2dev.serio);
 	priv->pt_port = NULL;
-	serio_continue_rx(parent->ps2dev.serio);
 }
 
 static int synaptics_is_pt_packet(u8 *buf)
-- 
2.46.0.469.g59c65b2a67-goog

