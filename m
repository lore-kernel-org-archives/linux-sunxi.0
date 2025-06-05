Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A7C1FF1C8
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Jun 2025 03:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749095211; cv=none; b=cgxiWhc91bZ9OIbzSPcSe0jRLlq/+QPGvVDOlNUrifhm0Xb7CASwJzn85yWVFrZ8guODjcazST9kqsIG1NgJ313gKSZ0bgPlJHfg/mNNMnTslky/imGiJiS8zURn/9ArDWzzRapgVgCOObKon2M20ThWzfpBpheoEd51DrVucQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749095211; c=relaxed/simple;
	bh=8TEfN32KZd6YJhzTAU5W2FFXyAmDYouG69xkiU/38RY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HiBsttPZPy/82zXTZz3rOZr082JwsG5q/uRxEMxxutcGEiQ6OvxswoohRNfSXzGpR8lqwOlq2SvuVwBUu7Fb7n2+WMETVxmJyE9ju6VQWlC4T/Uj0U9BR74b+QUvxufnenkeOlBKrmDGPCMA9l6QwQ3ZVY9GOWUlkaF4DV05OUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G49cCE/4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G49cCE/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749095209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xbtqvsf7BRpbL9q0tKGzMc/ghsVtwuf5Kl78Wf246CI=;
	b=G49cCE/4Ls4In6ufSQ2dLnLMsFUlfMqhOxwn1/ZxX+U0ke6dJvLMkD3mdtQZcKck39SXVn
	C0e7vWe4daL5OZaoOat+1oPSviYuZLK/cnCzqqYEaB4OteqnSquIYW7EhTtObPfzZsgGh1
	ByTNdVEaUuEkpsAo+1HZn6ArBrDw7k8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-hSawOjZCOlCHJFa_3Q4gJg-1; Wed,
 04 Jun 2025 23:46:45 -0400
X-MC-Unique: hSawOjZCOlCHJFa_3Q4gJg-1
X-Mimecast-MFC-AGG-ID: hSawOjZCOlCHJFa_3Q4gJg_1749095202
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6BC631956087;
	Thu,  5 Jun 2025 03:46:42 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.229])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6157C30002C0;
	Thu,  5 Jun 2025 03:46:37 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 04 Jun 2025 22:45:12 -0500
Subject: [PATCH 3/4] drm/panel/sun4i: Keep up with refcounting
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-of_drm_find_panel_part1-v1-3-c632e12e131d@redhat.com>
References: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
In-Reply-To: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749095111; l=688;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=8TEfN32KZd6YJhzTAU5W2FFXyAmDYouG69xkiU/38RY=;
 b=hgLlqDE82iA86gpJEHX2fHQf4POVn+EIXHPqw81ubtcFdUfF7dPMQSIdXkUcX+ngUZhsvVlPw
 DGg2MsfGbjfD5ueMCo+9yUhN+O3RALKd7EZxCHZgGjVQKTML4WQ1aJ5
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Put the panel reference back when driver is no
longer using it.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index c35b70d83e53b7397c6e38dde45824bd49fdf099..36d47d7cedde1e1e3e83eb670520664100bd0a25 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -990,6 +990,8 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
 
 	drm_kms_helper_hotplug_event(dsi->drm);
 
+	drm_panel_put(dsi->panel);
+
 	return 0;
 }
 

-- 
2.48.1

