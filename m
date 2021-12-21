Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AC92CA0
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Dec 2021 10:13:28 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id y83-20020a1c7d56000000b003456dfe7c5cso1295566wmc.1
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Dec 2021 02:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LiEdSYmJyAKWAqc7ui3XIZTznDZvFBWaDk4WF2mm3yA=;
        b=pBXL5mIQQqrE1sWVIayqcv1+QL5wyX/RH88FEO/rknbs31q5lPo7Gc1vsNLcyk0aeN
         GuQyqQB6ckAM/UMXeqF1shw9N22mmOkGalFRHuT+sytdWtPUY6l7oo5EMLPSC9rjEBV9
         21LHQ2WLsLqRROwJubFBoMUkkb+f2Mpgjv1O/Ong1dxmOUlcsz23vfcjqJD2j++ltWGb
         peffVNVGts7WXOfgJi/2dptWzKdsMGvyg+itPpnhRpO0/hj/T1dXFnSDVMWoyycHht3+
         GFC1s6NEkiwfR0QXZ9Es+IKcEhWteFlyreBY4mGdFzuw81AT1JVQ9BVWyEvFcTHkgWVa
         kz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LiEdSYmJyAKWAqc7ui3XIZTznDZvFBWaDk4WF2mm3yA=;
        b=ifURinH+b9N2DF9sv85vGkdJPFwhi5bfMsYpMeH4AUCnQTLYXFDe+LKzKavyOgPsob
         GXn5vb14pTdsHRd6kXytQS/gJlxLELse9tlAb+/xgiJaykC2w3LkbINjTB7ibfCx3Rau
         4KuB+ozu5KyP9O0Bxte9L/MR8pFRsvQ7lkCbzZoo0CT+KRwMPUQTXa6QWTJ75h6yz4wV
         lQw3ikUD/5DW4/7oquAe+9rx+6U7AUj2loRBo6UP0MLMAp91OztOYKo0FL6VJPFG05iQ
         CgPoqTHcL++jVVkYbRS3vfWoVJkuJb1GdXEccwUChFqIPv+4vMrzJ3obQipfh0bIkDVG
         hLkQ==
X-Gm-Message-State: AOAM5326UbvqBG+u3a9S7SeFuvpkdY4EpvE5ptRAX4TbtL6ZOb/Lkk/5
	wmIYXy+Q47DFITpGaOzzkis=
X-Google-Smtp-Source: ABdhPJxsRp72r/sEXZushQwODicy6txDdNbXADlfasQ0YwZfEqd1nrA21efVDrckpVqgvVS1sVerog==
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr2105184wmc.62.1640081607375;
        Tue, 21 Dec 2021 02:13:27 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
        by smtp.gmail.com with ESMTPSA id m21sm18012267wrb.2.2021.12.21.02.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 02:13:26 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: robdclark@gmail.com
Cc: maarten.lankhorst@linux.intel.com,
	sean@poorly.run,
	airlied@linux.ie,
	daniel@ffwll.ch,
	tzimmermann@suse.de,
	maxime@cerno.tech,
	mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 0/3] Add missing format_mod_supported functions
Date: Tue, 21 Dec 2021 11:13:16 +0100
Message-Id: <20211221101319.7980-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

When setting IN_FORMATS, implementing the
"drm_plane_funcs.format_mod_supported" function is mandatory to avoid
exposing a bogus blob.

This patchset adds a bit of documentation and fixes the issue in a
couple of drivers affected by the bug.

I reviewed all the other drivers and I didn't find more instances of
the issue.

Jose

José Expósito (3):
  drm/plane: Mention format_mod_supported in IN_FORMATS docs
  drm/msm/mdp4: Add format_mod_supported function
  drm/sun4i: Add format_mod_supported function

 drivers/gpu/drm/drm_plane.c                | 7 +++++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 8 ++++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c     | 7 +++++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c     | 7 +++++++
 4 files changed, 27 insertions(+), 2 deletions(-)

-- 
2.25.1

