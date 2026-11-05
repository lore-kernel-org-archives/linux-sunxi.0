Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887855;
	b=eY5mIus0odqxluHcgbJOO1kGOTkyhvyow5vOat79WdQfKerDKDsbTdABrHMX3QdmV5T8
	 sn9PN/nuz+eSeHT2z56PBOOFyUmaCjriyw06yFoC+p3wwMJF8Afp2IfbyKEarkTkOM/2O
	 5MFnZY6v1kYAIAH7zPntnu61phpS6/URMcSL3llrlMcRPqaFhppOS7MyaJovDRLatdmdh
	 RXdM9NuG7vXvPYX4R3xDBIXuuj+FIRoudq3dvgh5hIU13MCECx3RkBjl+C3lX+NaBF0Vz
	 Zj5SeKNi6kjq7Ks3FO5eRyFMca1cx5ixiLbDUtHUhN+oh7twRqF0t3TitFcwB2HZLHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887855;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=VYcSzDYe2cCmMS9VwuuEsQBYsAyzZgoeL8e35MmNwKw=;
	b=FG1DfLATYn5SyZl+ytxom/rtFOifHi1+8ndZwiT1lya6eSKq4Q9Ul8adusBtzMRa/Uph
	 dfQmBJxG0UrZAdNS0PyEOuBNeeCUCbKpKfRMPrD7mMYoZCDA2hzcF5jkucV9wUrHkLtyn
	 Vdcv7oQZnJKzEwFGjvAx6RkJd0D+USozq8uRp2/ruRO6LOQAToBd1G2F6d+9panlWXfZX
	 K75JNcpvqhVaV6Laok/t4qRFoX1OMXK5PMuAbfr/x3nCgfy37iX8H4FOnX1zpVkg5Hf9Y
	 rMql9hzjTt/sz/1JOGXbVQu5V1JXKkKzdNVrCYQVjbRUS/GWUCqjQkxZ1GalKURYlzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=boR+fKLS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6F1606A32D
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=boR+fKLS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F75D1F00919;
	Thu,  5 Nov 2026 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887854;
	bh=VYcSzDYe2cCmMS9VwuuEsQBYsAyzZgoeL8e35MmNwKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=boR+fKLSSPJG5ADEMzcTaXDOFXtpZfheE6ugTDWHy67B4361tV/Nfc7zUGv0G7N7z
	 YZGUNDKNG1JgdmwI8KPSs5JrLdH/MWTnqeqMulz82a7+iV1UMkdxmkdJU8NEIdcSAt
	 0kO1CJpbpGuISlGFBROL+1Uh1vKC8ucem0DxzqteocoLRaKvXaUzbAybfuxUUITvAF
	 TKYNmF2n+ZNewspUjir8CrkGRQKSu+eCsuz3BWdlx+NMjhjH+xA8pPbsch2x8kQeoO
	 ZUQ4UTd9rsMXEYv58kV4yVTyNJ4aNLtFz4TNjdos0tYGZbyYgxKOInLOGJM33IfVpv
	 d3aYeE5Vw9Njg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:08:04 +0100
Subject: [PATCH 47/83] drm/sun4i: Switch to
 drm_mode_config_create_initial_state
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-drm-no-more-config-reset-v1-47-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1466; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JVsRSfyjg+pxKH6555O56doMPhroT6uX2Lmd+IGrVQU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvejck9Po2TXZY4ax/Zcql+bM28gTymR8qM7o4oUfW5
 O6d1fPUO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEVtkzNhywMlRNslp4v6Hi
 x6Jr8TNXOe4N1OBec3lTluhZ9hVyrzKfaE7yebpLgHnVdBkXt+CwcsZa4eweXqNr71fM/uKsKXA
 rYuPMlp93dpf13kg+8qLjsuimv7cfhz1kVw0qY2yUr64qqf0MAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() has a dual role: it creates the initial KMS
state at probe time, and resets hardware and software state during
suspend/resume cycles.

Since the two roles need different behaviors (notably for objects like
drm_private_obj that must persist across suspend/resume),
drm_mode_config_create_initial_state() was introduced to handle only
the initial state creation at probe time.

Switch to drm_mode_config_create_initial_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun4i_framebuffer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
index fc822bc2c62b..0ce3691dedad 100644
--- a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
@@ -11,4 +11,5 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 
 #include "sun4i_drv.h"
@@ -27,5 +28,6 @@ static const struct drm_mode_config_helper_funcs sun4i_de_mode_config_helpers =
 void sun4i_framebuffer_init(struct drm_device *drm)
 {
-	drm_mode_config_reset(drm);
+	drm_WARN(drm, drm_mode_config_create_initial_state(drm),
+		 "Failed to create state\n");
 
 	drm->mode_config.max_width = 8192;

-- 
2.55.0

