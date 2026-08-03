Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DAA41D218
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773506; cv=none; b=KbM7igD1of9VW3ePpnE1OtvMhBdMukbtu6CDRnsHO9tyI2xALLTVayf+5vj212Wrbrmjtm5YoBk29pLnYXblRuSAEKtlHpjWRiWztNiz8ePwHqi9OUnVfWl+yIk5U9TD3giHNbJWFYXnxM2dfq+u7d5zeXMO5rVn5yFFME1Wr4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773506; c=relaxed/simple;
	bh=1914/fw+Fxj6W05SQ59nfIkVyGTvPvadr1OiGkJKAaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8cWRIpTnnRqTep4579n8xiifmUSNe9IvYrsyKUjpXh7Llt11qTJ9ZtOGw7ImV3+iNZ6EibDqVa4vF09a3miTRhBZPsnloK3+Yw6K8ZYlT8gNr6OdrI86fXFL9k9PnrQ63EatAeeSIr/y0YGzi+0w7IRG9WAhZ73Op9WXPqDT2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLMDVoWn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLMDVoWn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49800c6a846so20196825e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773498; x=1786378298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hC6MJ8bwLjjZgLx3/Q1ZtCKaKlgeak/LeNvekOVJvKg=;
        b=DLMDVoWn4ZF0f+DlNR7B7WYd+BIwtEv+X5kbOS9XVz3TZk5POCreBFk0cpM+Nld/KO
         oGccB2KKKqhvhn2Ei10tAjWBXCsJ0knVocnO0A10Ulmty/mtc3XsY9QpgTIjMxP3vXcC
         vHvvroaaegg1wIl5meh05AbxUQCr4IY2KJHCvtTdf27advS+HsBQho3EmRIW+KAFFoKf
         sy46h+i01btliypY0RVUzE6ndH6gKQaPCKyw1g01K9FRn3ydzKMD3dVknnbCH7dUQvDS
         Hq+1DPefR8I5LpupFWO6ycw6XnKdmeerQU4ZnMe5pAwPe9AFvlzlZSEVkscRXbHEL3ht
         KyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773498; x=1786378298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hC6MJ8bwLjjZgLx3/Q1ZtCKaKlgeak/LeNvekOVJvKg=;
        b=es9fKPPcAkuK+mlny0uk29kjgl27AD74/JcLeXQyCS2ge4OrgYr1+F0b1aILTF/0cU
         E/8TJBxBlWXmiQwN2AnlSmQv1HTffFJ6zVk67vTYb6FgtymYIOwgmJXCbo+kPCphDSvn
         5nEsLIXz1iWW7Ad51tvUUlBg/LB7zN6hVuIHsX9j3LJ+dP5JBmwOTrBSQ3D+WeMM72a8
         pgcvk4jmniFpulcMMx1YWzh2sRfBjhaABytP3WTEF+6edLhTGXa+phe2UA81H776MApU
         0m2ZfL4E0WzhVr/nIoZjCmfHsMGJ90T0hY7A0ZavvuByqK/1A5n9qKz2AHDpMpowab7i
         ipvA==
X-Forwarded-Encrypted: i=1; AHgh+RqSUVHgESbN6TNE76OAotnuzN0tdPwuvZNq+jqkzBd1tH/x+xd9gAfj2qGd3B9khTcXplqi80bJ0+TtIw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi4AtcFvu+dsM5JtEw8aQFHlYDwbBeQDsY5toMS0rAG7/QzGV5
	ap5Uq6onLwjnGqRVNhp+ZXxLUDjuTEcxXS7SwdyM1SRWSZk2d6eW8FJL
X-Gm-Gg: AR+sD11FL7J/YbLNnVhCj6wpUUy5Q+5SKjmkGSXi0tu0fZRI2dCaD8rCI+0H7Ve9K62
	qrjlMaq11afEEBjCcD4VCh0ZXPz3Gw+/5yASieED3eRSDGH+cQ15Q0R0r8Ea8QC+8cVBcpMFXU+
	cjOD0n0Z1GjqvptzHF5HTZkJLJuhruvsseTkMpHuKSyZTreQdGIKtkcWJk+nf3wcRCG6sGVNRPG
	kUdsFs+Nd2TSc+25u69RMzx7lCLP7ShmE9mb3tOkwCi5Okpv51IdfrmKCYQNcFcy9BFOCtaXSq+
	XrhSXkYoncNmGgAKTnzK2xH2D1EJxrx78NTh09HS1rUn5FyCTv+SB0Dj/VvV/po7uZDP20aiLjW
	2jEe8BEySdEQe6yBXdx1DTKMfxGG9WGacd2zBTfy/OsmZvCJGfmPESzu0OLcbkb8oMRqJtaQ/Dq
	lCFDjlQfGQljA4wjTnoEKxYaRrC8q1atxq3w+N0iIg8hDKMag/uVLryzL5UbmEo88NASee8qg6Y
	zIH4EgtsdMaxZXo/L4toBtk/jFErwaZ2XgDdd/5PuZ71FHdG74EJM0jVDlv6schXwPdXmjVS6pP
	BnKID3Gn5SDrMVSkjsrnxlI7E9kOXZ6BOqSmIzy5y3iSaCPSIuMGXzd+BigWmMZpseO2kR/J5LV
	gi5UkcrPLyCJL7W1ljgZQtd/ug8ywzIfH3gmwI7VUb1kUudqjpCDLg+mHjqfxKAF0ZAZlyZI3nj
	Nxdw==
X-Received: by 2002:a05:600c:4e8c:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-4980c66c82dmr193167225e9.1.1785773498389;
        Mon, 03 Aug 2026 09:11:38 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:38 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 11/13] drm/sun4i: Drop node references while building component list
Date: Mon,  3 Aug 2026 18:10:49 +0200
Message-ID: <759c74e3a22b97ca066ef7910ca4b91b852011e6.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two references are leaked every time the display pipeline is walked:
the output port node in sun4i_drv_traverse_endpoints(), which was never
released since the driver was introduced, and each node taken out of
the endpoint fifo in sun4i_drv_probe(), which stopped being released
when the fifo was introduced. The latter is still safe to drop right
after processing, since drm_of_component_match_add() takes its own
reference.

Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine support")
Fixes: 8b11aaface2b ("drm/sun4i: Implement endpoint parsing using kfifo")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 8a409eee1dca..e9baca360160 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -289,6 +289,8 @@ static void sun4i_drv_traverse_endpoints(struct endpoint_list *list,
 
 		kfifo_put(&list->fifo, remote);
 	}
+
+	of_node_put(port);
 }
 
 static int sun4i_drv_add_endpoints(struct device *dev,
@@ -394,6 +396,7 @@ static int sun4i_drv_probe(struct platform_device *pdev)
 		/* process this endpoint */
 		ret = sun4i_drv_add_endpoints(&pdev->dev, &list, &match,
 					      endpoint);
+		of_node_put(endpoint);
 
 		/* sun4i_drv_add_endpoints can fail to allocate memory */
 		if (ret < 0)
-- 
2.43.0

