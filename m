Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEDF3EBF2F
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 01:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771292902; cv=none; b=qblxaJ7KqlVM/x4zajeZIPeq7fklN4TlhQXQBuXpjQ2Gq3QcnqmlUah6yYPI5G31imV2nbPh8pyl2Q2nAmYvfCUUqEDIYEsVE+UJyvAJAEmV/Ebt0y6pIoScYcmHNLx3mO2Tj3LTM4cUVIH7CP/SI0YPqgmqSiXoMc+Ha8sxytM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771292902; c=relaxed/simple;
	bh=Lwg2rvwrqIRECklSNKlUK55K0k33idFGObhMA9v5xU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P15c043kLiYBI8jBqcjRnzxn3axeWzHZEu31N8runq6tII+09ri4yBOXLnNUzsZYXxXDvqZ+Q/4J85A6yjbhLQ//ePQlubeEW7XIXn7qXqGB7EfSoARTdXYR2iOV9DALfCdoluQrUaZMjDIZ1nWW9iQwPonsCoGW3GbonAOdxWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRMbha39; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRMbha39"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79495b1aaa7so34447877b3.1
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Feb 2026 17:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771292900; x=1771897700; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BjA8YI4abbHFrmSC0kcj7gswukKzCoDbvbkarUE29Sw=;
        b=WRMbha39sk2K0MpNggDtOBvnwBRISlUY7uLoU5RVbuN63g1bBSAZNlNm64af61FQB3
         X5i2EsDWyKdwtcEic22b3/zzpoIRYEp/LR8npWpGniaonBgECLnvBspbf9FNWjFvl6GH
         gsIU0+4IPkuP2xrth6H++9bojGBvVHEo/WvSESawyKqhyazxgkWvBMYYtjkzzdvLgz4q
         zQqkvFwO9N08BZEuvpmkX3UVG33yG9Nrzuco6bKEBUUKQ8tpWk76cbSI5CozX0ept0H5
         9zpehiBglaTZGq032owWFJjiGar1H9v4oZuBu3oMHzpKBHI5fJkUcHYprDHky9gKy0QF
         glvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771292900; x=1771897700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjA8YI4abbHFrmSC0kcj7gswukKzCoDbvbkarUE29Sw=;
        b=ulye7m/1kHHqbuk0Lhwql3DSTC3p3fXTogROKsH+9wOkvQ4ITO8l+XGrCTCAoCu+84
         fuwnUD4vP8w/uuFe8REK046M/szxN+Szkald/byQknycTOyE/sHdaK9tpqLJAQuzkvB9
         gEBG4KGaSrdmCAQTMJdvwIZB2yRPuIA2j599odACdRJz6k7Vbgezaa8BiR71S3wniEF+
         A1eqMKt6VfF+5BVhcXv72/r5lxJKXzXOZaE/5ffix0YiGFGAfiVUNqPxlnYp6W/baf3S
         U8vaZ0v8CfltoHok0aUQ1IJeWqLkz/meo4tS4YR2eaFiQOyqSGXR4+GHBDxgv3+lBsZ8
         hbLA==
X-Forwarded-Encrypted: i=1; AJvYcCVPOfeP7UnZ0IkbwvXbhqdzKugbHymgaVtg/Bm5amzfobxgWqSa1PAIYXhKr//etUn2z5qMD6qnlEmw/A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4OHfVZqGpBHqxWcTeHmb/A92TXxZ6Au2aAimdb9LsLDQw76LD
	Pyt5Z80qzbueSWOYF0dN/CJ0W/JJiB5z9GPXPIGQqpqhkoC4mJLKhJLT
X-Gm-Gg: AZuq6aKBliGVaI2v+o59sUBskrhlLGxN3B/xkHh5UxLusGXl90dJBh28Gl86l/55oQ5
	l2iesxaRF3l98f8WMXm25OO30m2m4tLnS2+3hKj9E6kxUYOqkR4l/AKlKfGxGWEGVHyshv0GGKg
	Z+AnDYzZTqQJwlcrsQMN4r6lS2UCw9eM9zwOdpcJ1DOm14QFe2eJJaDIVCg2DwE8nkAwayb85/Y
	Yd0M5LbSeNOmrKOH6xw8V91jqdblcb/xKB03qvR57vIn5sgQVUTLNrlTjTVgDhD5HtlqPQPHfSR
	68Ae6V274RfHwS3+8GfsPZVc0AHsHsjxN2Isw8Jt8yvKZjV723uwfT4p3kKrEqKo9FztDi3weis
	bS1zyuAOk8lXKAjL2fYbKcVinTIOdt9q8sg20WJ3wGBBig7i9BYVmqijO+5fuw+UdUMEiK/A3CV
	HgPjFkXPRDd/RVNxKXitZ61Cf+XJFKHwuVoTeRNdhi3rX2ACFyh9kTMLwiqNG3WxIUhjRJnriEW
	eVo+lAX8zkPoPC0n4Kri+rPt1FUhmtXKjWzUXiE1T4=
X-Received: by 2002:a05:690c:b1d:b0:796:55b1:a16b with SMTP id 00721157ae682-7979e81638bmr110018307b3.31.1771292900128;
        Mon, 16 Feb 2026 17:48:20 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-797a668ad26sm43680067b3.37.2026.02.16.17.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 17:48:19 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] drm/sun4i: backend: fix error pointer dereference
Date: Mon, 16 Feb 2026 19:48:01 -0600
Message-ID: <20260217014801.60760-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function drm_atomic_get_plane_state() can return an error pointer
and is not checked for it. Add error pointer check.

Detected by Smatch:
drivers/gpu/drm/sun4i/sun4i_backend.c:496 sun4i_backend_atomic_check() error:
'plane_state' dereferencing possible ERR_PTR()

Fixes: 96180dde23b79 ("drm/sun4i: backend: Add a custom atomic_check for the frontend")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 40405a52a073..6391bdc94a5c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -491,6 +491,9 @@ static int sun4i_backend_atomic_check(struct sunxi_engine *engine,
 	drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
 		struct drm_plane_state *plane_state =
 			drm_atomic_get_plane_state(state, plane);
+		if (IS_ERR(plane_state))
+			return PTR_ERR(plane_state);
+
 		struct sun4i_layer_state *layer_state =
 			state_to_sun4i_layer_state(plane_state);
 		struct drm_framebuffer *fb = plane_state->fb;
-- 
2.53.0

