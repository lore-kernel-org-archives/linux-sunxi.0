Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1E32598
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 08:49:40 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id qb20so10504747ejc.6
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681116579; x=1683708579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y5ePFxjbLBzvierh0vPmoX2AJ6odjU/okQNVSYo6+J0=;
        b=RCJpuhAmaiEhyX7miTtpDm2B6aHyY7G7AUvRlRukNsyjL70ZJsCQAtaj3OQvh5OYPV
         TFriUULQnUDlx2HjEsI/Kw2Ah9VIJ9ZIeDYYBye3hexNLts3plMTPCJjFWrxMbIu6Eag
         XjqvoXa1xSsAljafdAreM72uC7lUHl6yPkaAmYZuhufCOwNvWRRWHj1YBOsWfhdoFgnF
         kSBopPrfEZ28my/Fa41Qr6TJNH9JpbaOPigMEYVU/B8HSmVqjIqBmV8qS+8UuhdK0dRL
         nxO6iYDY4vXdt8A9z2+h74Uj92wooKBV/Qh70Eg4GbRrknLo9F3pWeHJHPTVX9UIkidz
         CSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681116579; x=1683708579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5ePFxjbLBzvierh0vPmoX2AJ6odjU/okQNVSYo6+J0=;
        b=claL765FieTyomh7klItUmaDBWFqIKcd7L6kTm8V0SkBJzDd+E3i08Stnt48Si0cjI
         lE+neRTWitA77QItw9SbbKvKQXmRQM/Eal1Oo3TjwsTlDf/Vo8YIJtIFFENAgAzuP12d
         xMlWQ8+VK0nUrebjrAWsHGxSTs73RXWFqIcG3Tt1M7huMn90ConAsKbcCH/Hsv0hNted
         DUKmyOn8q7W4YsGhGdW4hMfZTmjiDBqew96LOQ967oXRmd1pveXWxEgAa9zG/jlvWLni
         hIkJCjrAOBkLRAn/RX0y12Av1hiCMyzggOANKTb8Dqv94DfYw2OsZVtD4MlAkLFHpeIO
         KVSw==
X-Gm-Message-State: AAQBX9cMdzAC5b6pkDnr4fnisnL+wSpFAsQCdgsiKQlkZggLKpgqO+Dn
	2lWiLxOWcVatJMVbb6Rm3A4=
X-Google-Smtp-Source: AKy350bKbp2C72vty5skdGElAcpoLwKvITKzpR2b0BLRFPeIA6nODgwcXIjQGRg4GNgULAPUQS2ugA==
X-Received: by 2002:a17:906:8585:b0:94a:7a2f:d6e8 with SMTP id v5-20020a170906858500b0094a7a2fd6e8mr2904492ejx.61.1681116578666;
        Mon, 10 Apr 2023 01:49:38 -0700 (PDT)
Received: from localhost.localdomain ([154.72.161.184])
        by smtp.gmail.com with ESMTPSA id v13-20020a50954d000000b004fc649481basm4709962eda.58.2023.04.10.01.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 01:49:38 -0700 (PDT)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: maxime@cerno.tech
Cc: airlied@gmail.com,
	andrzej.hajda@intel.com,
	daniel@ffwll.ch,
	dave.stevenson@raspberrypi.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jagan@amarulasolutions.com,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-amarula@amarulasolutions.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	maarten.lankhorst@linux.intel.com,
	marex@denx.de,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	robh+dt@kernel.org,
	sam@ravnborg.org,
	samuel@sholland.org,
	tzimmermann@suse.de,
	wens@csie.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH 0/2] drm: sun4i/dsi: allow modeset helpers to manage display
Date: Mon, 10 Apr 2023 09:47:48 +0100
Message-Id: <20230410084750.164016-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change moves DSI PHY poweron/off from the encoder to the TCON. 

As a consequence enabling or disabling the DSI sink can be left to the modeset
helpers, and bridge support easily introduced without touching the 
drm_encoder.bridge_chain or converting the encoder to a drm_bridge.

Brandon Cheo Fusi (2):
  drm: sun4i/dsi: factor out DSI PHY poweron and poweroff
  drm: sun4i: tie DSI PHY Poweron/off to crtc enable/disable

 drivers/gpu/drm/sun4i/sun4i_tcon.c     | 10 +++-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 64 ++++++++++++--------------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  4 ++
 3 files changed, 43 insertions(+), 35 deletions(-)

-- 
2.30.2

