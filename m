Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51855A32
	for <linux-sunxi@lists.linux.dev>; Mon, 16 May 2022 02:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=e8hR3
	bhFJ25k1+0lwJ2r27cDbS9JSZXAViwx9EEkoCo=; b=MRmp/elM5x/rdLRi8ceBP
	Md6NgxvrQo9ByRu/Fs+Bp5UpTI4O6YffUrKcwoK32iSB3I+6dGct7KOxOKbsFW9P
	JCgXg0BVYriZDtNlreOaogPlRBGDWsxJxr46VXDVRxpxPZXARNIBFRWGey/Cf5QJ
	l+fsNMRvdlWByBBerSMSQM=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
	by smtp8 (Coremail) with SMTP id DMCowACHYyG1s4Fi8FLcCg--.16808S2;
	Mon, 16 May 2022 10:15:17 +0800 (CST)
From: qianfanguijin@163.com
To: linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v4 0/2] ARM: sun8i-r40: Add cpufreq support
Date: Mon, 16 May 2022 10:15:14 +0800
Message-Id: <20220516021516.23216-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:DMCowACHYyG1s4Fi8FLcCg--.16808S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruF4furW3Zr18Gw1UuF43Awb_yoWxKFbEq3
	WSgFW8Ja95ZFyDtFZ5Jr4UXryxZr45GryDJay0yFyUJw1Yyrs8JFyDtayDW34rGFy3KFs8
	tw4UJF1rW34avjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRmJm7UUUUUU==
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXBcD7VXl25DG-QAAsl

From: qianfan Zhao <qianfanguijin@163.com>

Change history:
===============

v4(2022-05-16):
- Invert two patches.
- Drop the cpufreqs that exceeds 1G in opp tables.

v3:
- remove "allwinner-r40" compatible from allowlist.
- split dts in two part.

qianfan Zhao (2):
  ARM: dts: sun8i-r40: Add "cpu-supply" node for sun8i-r40 based board
  ARM: dts: sun8i-r40: add opp table for cpu

 .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  |  4 ++
 arch/arm/boot/dts/sun8i-r40-feta40i.dtsi      |  4 ++
 arch/arm/boot/dts/sun8i-r40.dtsi              | 42 +++++++++++++++++++
 arch/arm/boot/dts/sun8i-t3-cqa3t-bv3.dts      |  4 ++
 .../boot/dts/sun8i-v40-bananapi-m2-berry.dts  |  4 ++
 5 files changed, 58 insertions(+)

--
2.25.1

