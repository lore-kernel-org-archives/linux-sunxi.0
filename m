Received: from mail-m17638.qiye.163.com (mail-m17638.qiye.163.com [59.111.176.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D708428E9
	for <linux-sunxi@lists.linux.dev>; Tue, 10 May 2022 15:30:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [58.23.13.247])
	by mail-m17638.qiye.163.com (Hmail) with ESMTPA id ED95D1C0190;
	Tue, 10 May 2022 23:30:19 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 0/1] arm64: dts: allwinner: h6: Enable CPU opp tables for OrangePi One Plus
Date: Tue, 10 May 2022 23:30:05 +0800
Message-Id: <20220510153006.279233-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUIeShhWHUwZHk1MThpCTh
	9NVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pwg6SSo6OT0xUVEqCQssDUsB
	DgEKC0xVSlVKTU5JSkJNTUlLTkxPVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
	VUlIVUpIVUlPTFlXWQgBWUFKTkNLNwY+
X-HM-Tid: 0a80ae97b78dd993kuwsed95d1c0190

Changes from v2:
* Remove regulator-enable-ramp-delay for cpu and gpu.

Chukun Pan (1):
  arm64: dts: allwinner: h6: Enable CPU opp tables for OrangePi One Plus

 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.25.1

