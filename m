Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9C414012
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Nov 2024 01:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731030040; cv=none; b=Nwzro+DcrRXDXJpZCMp16/29Q5oZh4HHPU/EZ7OBBx7zdAKc3jAEujTIq09RpF+nUkofFgQQL6ysmOp2wU66GW7Q7ph3UxM/P6JPRDANGHiSvCNxwOWydxyLjOXzY120iS2kw20PNTQoSqEmNqGil42OY4a7TLBewRbsMX2jd8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731030040; c=relaxed/simple;
	bh=/vB0A4Fo73KYupux7oAj+r9VcPiEW2iYRAxwvj/9zQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FHZg6IucukPtuKqq6np0M01NSjq5F+m0ayFFQdruLj7WrewBKeyZX6RxvtI+acPjllKgd31cLYpFbaWb0jZSbUNHpHR6dJrz8bJSnxDyi6yDnxZoUJpTlKzKOdpyyY9a+OMJoSrYN7uoyiX/JQzOWrkXCV0uXPVmRoLFeZ4G60o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jookia.org; spf=pass smtp.mailfrom=jookia.org; dkim=pass (2048-bit key) header.d=jookia.org header.i=@jookia.org header.b=WF2/syJt; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jookia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jookia.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jookia.org header.i=@jookia.org header.b="WF2/syJt"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1731030030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6SlCiON3cqc4vz5XEx0DbdrM/vWAePnU2JUI4leZ6jI=;
	b=WF2/syJtOv9gwYRzQQK1Tz+p1n4sJrrJLYf6JPhr4NQx2c6Iw6zAHtykD4VMfVDb87vyzB
	jXzcA56PrPqGfGZ87I59f3am4g3k10zRtmQqXN3hUgd4Q52hIIMFbGz1L12DtKfmwY78e7
	7ukelI1ZN691Mg04CRZI98dcskVRYjhvC9xfP/SWZjLDkIaKrA6eUJ71B5zunAgIH7P396
	fWnvUh3BTtz4c80J92JDReVBSxL996qjPLUEgpZ6LdvPIQ5MXGMLkfFRIb+izCLtXnaKNx
	s++5GHIB5NvWO/kVfJlTf8Mfr5DQj9qDRg42hBNZJ3CP2nSLfg92T8xntc2MvQ==
From: John Watts <contact@jookia.org>
Date: Fri, 08 Nov 2024 12:40:16 +1100
Subject: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
X-B4-Tracking: v=1; b=H4sIAP9rLWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQwML3ZLk/Lz4tMwK3TQDUwvTxGTLpMRUAyWg8oKiVKAw2Kjo2NpaAJr
 NfK5aAAAA
X-Change-ID: 20241108-tcon_fix-f0585ac9bae0
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 John Watts <contact@jookia.org>
X-Developer-Signature: v=1; a=openssh-sha256; t=1731030018; l=1221;
 i=contact@jookia.org; h=from:subject:message-id;
 bh=/vB0A4Fo73KYupux7oAj+r9VcPiEW2iYRAxwvj/9zQg=;
 b=U1NIU0lHAAAAAQAAAEoAAAAac2stc3NoLWVkMjU1MTlAb3BlbnNzaC5jb20AAAAgPs7MDd2XR
 g2uRE9caV1lPPPeu0VzIG9fPrrVmYyAhLcAAAAEc3NoOgAAAAZwYXRhdHQAAAAAAAAABnNoYTUx
 MgAAAGcAAAAac2stc3NoLWVkMjU1MTlAb3BlbnNzaC5jb20AAABAsAsDWjawAwJm303ak1F4jDs
 LCMxEG6FoKq9hlQS6kcxUgFAAZdOULuhjgKrLrSACLm5/JiQDk2aK42XP22RlBQUAARju
X-Developer-Key: i=contact@jookia.org; a=openssh;
 fpr=SHA256:/gEvgms/9HpbgpcH+K7O4GYXmqkP7siJx9zHeEWRZTg
X-Migadu-Flow: FLOW_OUT

On the D1 and T113 the TCON TOP cannot handle setting both DEs to a
single output, even if the outputs are disabled. As a workaround assign
DE1 to TVE0 by default.

A full fix for this would include logic that makes sure both DEs never
share the same output.

Signed-off-by: John Watts <contact@jookia.org>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index a1ca3916f42bcc63b9ac7643e788d962ef360ca8..543311ffb1509face3fbfd069ded10933f254b9d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -179,7 +179,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 	 * At least on H6, some registers have some bits set by default
 	 * which may cause issues. Clear them here.
 	 */
-	writel(0, regs + TCON_TOP_PORT_SEL_REG);
+	writel(0x20, regs + TCON_TOP_PORT_SEL_REG);
 	writel(0, regs + TCON_TOP_GATE_SRC_REG);
 
 	/*

---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20241108-tcon_fix-f0585ac9bae0

Best regards,
-- 
John Watts <contact@jookia.org>

