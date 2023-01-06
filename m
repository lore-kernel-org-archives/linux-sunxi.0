Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DEE95C1
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Jan 2023 19:40:44 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id w1so2219165wrt.8
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Jan 2023 11:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3pLrA0e7dO7LrecMN4OGEXGib4gEC2V+7dqek4qftoU=;
        b=oKfkuXTa5s6uLxxzlF+9y0X9m3c12iFCjrYupYQMqTZ+Rh7BbXZ5dDqr+Z+8w07Ko6
         Ptz/4ln8NeqvSEv9mvufpjJ9sVdCKspZYcX4QiBPTVwNId1HelbG0cj7q8dk1EWbLL1g
         Xf3OK2cLjao8Gnlllc9yCcTNLOfsiBBOY+OYAfpevV4Fq+bxgm26xmE9AL34m2MoXHrz
         TD+ADH6CUZu2+ifAKF+g0OKjotM3yFJ3H2hD4RF80JwIpy+K+Ia4BJA23uYy2Pua0Vgg
         dVqlv0jBwvLV5K/QSdsWBspmN+5WN4+JrZjoo7Zs3+6RUnNYVVMMcQhwr4Srxz6oUVgv
         Ii7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pLrA0e7dO7LrecMN4OGEXGib4gEC2V+7dqek4qftoU=;
        b=mvNLn2Vk9PlgGt6fPi3I2E6LC7uBqgfk3zFOmWqgeiwvfE7EOaOJamjB8Vt/8seQ/T
         kof/tR2nwL5tKM2BLmLqn7zvYFHJ61hhPeMboPabX1DLao0fIq8B+O99GuiztFSUKfCr
         Eb0N3NXKf+eTDXKkt7yr3KyKZq9f3SUqtwha7gFbsqrkdj85IRb8lNkJ8U8f9biX256Y
         sEJ8MsX+yCEW4Dj2LFfjqkDcQIv8Iy/sQ+cCEcDdhi4PcIIbADv3Iyl+HL5w12/79Ptz
         FrG1kECa5pFDL54Hvw1jvIDlCeUDqZj1YmhGlht0gmuJME5EGX4Cgu9H9iaHNmxKnzMI
         SSkg==
X-Gm-Message-State: AFqh2krZ0E9TZawExYbVZaa2X9YvALQ2H7NpJ1ovcCguOFUPMFYRiB6A
	FvCRHq7q70jqVZjUx3khhl0=
X-Google-Smtp-Source: AMrXdXv9SgWICruHOFPKbZPr2dFwm8ciXKTkrOmjA1B8aLDnDi2DU+NsKsS03ziq/Z/1Nu4FCajxWQ==
X-Received: by 2002:adf:de04:0:b0:29a:f48:770a with SMTP id b4-20020adfde04000000b0029a0f48770amr13167781wrm.40.1673034043184;
        Fri, 06 Jan 2023 11:40:43 -0800 (PST)
Received: from localhost.localdomain ([90.242.19.250])
        by smtp.gmail.com with ESMTPSA id bx9-20020a5d5b09000000b0023662245d3csm1968650wrb.95.2023.01.06.11.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 11:40:42 -0800 (PST)
Sender: Adam Pigg <piggz1@gmail.com>
From: adam@piggz.co.uk
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	mchehab@kernel.org,
	linux-sunxi@lists.linux.dev,
	paul.kocialkowski@bootlin.com,
	laurent.pinchart@ideasonboard.com,
	Adam Pigg <adam@piggz.co.uk>
Subject: [PATCH 0/3] suns6-csi changes to support libcamera
Date: Fri,  6 Jan 2023 19:40:35 +0000
Message-Id: <20230106194038.16018-1-adam@piggz.co.uk>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Pigg <adam@piggz.co.uk>

This 3 patch set adds V4L2_CAP_IO_MC and vidioc_enum_framesizes support
to the sun6i-csi driver, allowing the Pinephone rear camera (ov5640) to
be supported.

These have been developed with the guidance of Laurent Pinchart, and
been tested by capturing frames from the libcamera cam utility.

In addition to these, a patch to change the v4l gain mode in the ov5640
driver, and the 2 format propagation patches all by Laurnet are
required.

Adam Pigg (3):
  media: sun6i-csi: merge sun6i_csi_formats and sun6i_csi_formats_match
  media: sun6i-csi: implement V4L2_CAP_IO_MC
  media: sun6i-csi: implement vidioc_enum_framesizes

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 215 +++++++++---------
 .../sunxi/sun6i-csi/sun6i_csi_capture.h       |   6 +-
 2 files changed, 103 insertions(+), 118 deletions(-)

-- 
2.39.0

