Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7190AD4A
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Jan 2023 16:22:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05CB91026;
	Wed,  4 Jan 2023 17:22:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1672849339;
	bh=dbFdcHiTydDgtP5vNT6pBiDy173XP0n7SIZhDylU7qI=;
	h=From:To:Cc:Subject:Date:From;
	b=n2TaHU2385f6F1kHt4jG0HEVGbUT2fCfm6GSe3aqLDtk4coO8maU9IQv9pOyMJg0N
	 lTDZnz1WFNSU4qzn+bNBc1Qctn8XTP+ctFeLmcedlKqYF9O0bB+Tlu4GJG+lR2vE30
	 qw8xqf4oYBgo/KlWUN/PtEQWUvMDxiHh0WC64nz8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Adam Pigg <adam@piggz.co.uk>
Subject: [PATCH v1 0/2] media: sun6i-csi: Fix format propagation in bridge
Date: Wed,  4 Jan 2023 18:22:13 +0200
Message-Id: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series fixes format propagation in the sun6i-csi-bridge
subdev from sink pad to source pad. In order to do so, it uses the V4L2
subdev active state provided by the V4L2 subdev core (patch 2/2), with a
preparatory patch (1/2) that drops direct access to the bridge fields
from the capture side.

I haven't tested the patches myself as I lack a hardware platform for
this, but Adam (on CC) has successfully tested them. Adam, if you want
to reply with a Tested-by tag, that would be appreciated.

Laurent Pinchart (2):
  media: sun6i-csi: capture: Use subdev operation to access bridge
    format
  media: sun6i-csi: subdev: Use subdev active state to store active
    format

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 211 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  23 +-
 3 files changed, 110 insertions(+), 133 deletions(-)


base-commit: 6599e683db1bf22fee74302c47e31b9a42a1c3d2
-- 
Regards,

Laurent Pinchart

