Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729493;
	b=fV96GZ2ssMRmJ6pU1B8Ya/19xVekLqqdLFlIK3DLdenwEn+6WvjfbqRuYASi8XydJ9Lp
	 3BeMbdz3XFhWV/JH3P8jRW7s6WinW7weBGI0H2suKeJ2mEv609LpKnLJqM0r46sIezx4+
	 XIwBPyfuQbXr67AlHo5YOJF7NOrX6G9blt61x2T2Q4R+8AhWNp/+jwi9xnYjgYpAbEJlg
	 Pl/93GISG4kYPZ4hoUeoRCSvwSWBwEYq0K3joHCBbSqFFinl+z1pQHyQh4/XjoCSSF5UE
	 SDLEsUnBkuVVSgkEsLLAgygCj+pX304HhyCTS3gIRnqLpiDp6so76NJAWCGykeXtwrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mLBiJ3Y98YIzDtQw/fAmF2XOq735TmDEhRo28kTS8fQ=;
	b=2C+y3g3SMjSyV70w3HZFL90PkqDRmTKFygcWDhFcuONEqBlh6gAU95yncH3QvVVP8CyO
	 rNrI+y3uvyMoAV31JFitydzCV9dPh96FHF3/y4ZH2xNamIns3fq9RGkYII0ZBLBd9M4DQ
	 ku1nubVy95Ikv3WKkgDzzv4hNTvoKg2vtgTmDt5Tj4ohKGH9PQgbbaUw87q2nVKYXTm3y
	 C0glInpY4Kv7d9br8qQSr0mecsN4gKkJng5QZmRzATVcaT4VpWw4KVLNWaHzCglS9sQs4
	 EbOk8LI/Ws2VeoN/gl1gC3PS0Bku8DyFds4SKbXwR6GU0ccn5spAmC1DWLJGZQVLrwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DZ2s/rZq";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD3760A380B
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 21:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BD3760A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZ2s/rZq
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso4308699f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 13:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729492; x=1796334292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLBiJ3Y98YIzDtQw/fAmF2XOq735TmDEhRo28kTS8fQ=;
        b=DZ2s/rZqgLQcVSU5hQ6DpanwaNWFurbwko8IB809I1qQm9o/LVu5+3W1xm5S1ulmKB
         Uz+afziYuJJkxPPIvekId4+GqCRphqi9P6r5VnLH5uvTldn3unOCHr3Kk3aH4RQTb4Ig
         RA3E3DCdmfpp8NUvvCm7UIyw+LtOwC4HB/KbeaqE3RZURO5QoTOa24iDW99kW7A7JG34
         S/VuZ2zZUfif0cHqduwVplHsY24CM+Za7Bp0j9aoTu6l+KbcY0b2XYVeV7xThCjeN525
         ny/ba2htSbaVd41JhGQT7p9xLGsGGTPNQamjhL8I7yl1e0nW89gSouhvIErR5o6OPqJy
         0UFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729492; x=1796334292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLBiJ3Y98YIzDtQw/fAmF2XOq735TmDEhRo28kTS8fQ=;
        b=M00pAMeOXOaW7YnZvyk27rb3A+9x8AdM5eX37enBvISuEWJyLXA/nkBSytnjDqnNcD
         TIye/pQ5X2m0+4HoScSkBCH9wLbc9vI9PqaZgmEOpw4do8frAd+Am4R0/wccumglJcnK
         lbS+CTdPc3uGG/ajw2d3eeYqvrml+v5U9k1yI3zd5odaSiKwQp9EVOz3+qnShOmn4k5+
         I/M5WwEPGLWn+GhTPJwCCsNoqyujwljgQ1rv/7uq2AZWoGulQL9k8NAqKMcV2UdH7VIL
         r/EEwoOOVtsyIqzpn1VN9EItUnRJd8D74Gch4mcCAZ1WdtO01JxUxDWd3QXGdQjgZnME
         Mn3g==
X-Forwarded-Encrypted: i=1; AL+hErGdgT0ABoCndwjWFRlmDEtvPVdkvNDcAhNr/qhmUcuRb47Ey5F3oQp4lH8gxhr7VMOY9KL+S0PmNOV5iA==@lists.linux.dev
X-Gm-Message-State: APuU4Z91K6LDtHplb6MNPdcw7cK9jg4FCK+QXY5dwLNY9NQlDKzYwxc0
	RVDyL/AvRgD1jo510o/1RvLsM0sZPZnLAID9IrdrGCkHZMiXLGUhKwu9
X-Gm-Gg: AZFdTZcmvdWrYXEh9Sq6HaVfVPh1gyEspLpJOi0w59zeWy0H0KiH/NNlZvpSG09lyjp
	p7I2KERLiQNYZNRR+ajHw+6cLtkXYJVgEQi4fqLrWLuwaBCnWcJs7uV276AVWSLCAuw+5AvTR6I
	umJYEu7R4lH9LNLiJw8XFOBeipsjkJDaBJ63+RtZ0SgI0XmX4txxM7qmoHKZPUn0FZAuvecNNN5
	NDTmAyuCwRLdwSsgqIiWfg3FQfk0tbmNWgz4/6EQBDpK0hbURiUHIOkcH/GsZV93I9vGNeeqGfp
	mKnZoJhE0c/3a86BbOv3l23A9+u55pbvWlDvJZXY440QO/wIzfsVlNpCLLawMoBXhMHPCYkCUXp
	zQbpzWg44a4OlCLAfp9YWNo9Ar3abwda6kft7/uJzSBv8k+I+gM4i6eT2w74/NXkGo4S1IjL5oc
	mN7bPrzsFzM57Cxh4Nt2tuOq9FhaIR2SJ3/EuXIvD5MPPAHfHcWnElluFjx6gCwHjHtEuYHfnRI
	nW/f9frGAZcjDTwnePR02LEOmWObJEwaXEmf2rZGjfvGr2fMX0U65og3VTgM5rcSCbQKLOG/N65
	JNeP2lNKBpXKaIfuD2oC0HbjL+BNbE+a9WHXoef8XUvjBk4SuVV0DTtvS6oQTVxoxxUCxuLGR1z
	ZTaY8i8NZHhS0i6F+feDMVmu4ABzmBFOMgvpt7FE1zPmMSc+A17OvN2tj7yxuKpYegVaObCEKN9
	SOs0n0qZPDSP6dFeX7FMBn25kt2hGgSjxJ9d9KX1UcHhrqdR8ZR3xZGpnb/NtsqwIoG9F5ZwEXm
	Xcktwq/AbvZQl/QzkybDKiJ6xgkqLgeZLliPTUtTPOJdKWu6USup03AyORx4Yrc
X-Received: by 2002:a05:6000:2c05:b0:4a7:ed95:7c9f with SMTP id ffacd0b85a97d-4abb19c16a4mr44426780f8f.22.1795729491930;
        Thu, 26 Nov 2026 13:44:51 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] drm/sun4i: Add compatible for H616 display engine
Date: Thu, 26 Nov 2026 22:44:31 +0100
Message-ID: <20261126214433.3562326-10-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

Enable H616 display engine pipeline by adding respective compatible.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 248be5ff4f36..18cd9a993348 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -442,6 +442,7 @@ static const struct of_device_id sun4i_drv_of_table[] = {
 	{ .compatible = "allwinner,sun20i-d1-display-engine" },
 	{ .compatible = "allwinner,sun50i-a64-display-engine" },
 	{ .compatible = "allwinner,sun50i-h6-display-engine" },
+	{ .compatible = "allwinner,sun50i-h616-display-engine" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_drv_of_table);
-- 
2.43.0

