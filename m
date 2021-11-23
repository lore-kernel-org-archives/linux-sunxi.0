Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF94F72
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Nov 2021 09:30:11 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1mpS7f-0004zK-Ra; Tue, 23 Nov 2021 10:29:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1mpS7b-000acE-Qa; Tue, 23 Nov 2021 10:29:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1mpS7a-0004Y4-RI; Tue, 23 Nov 2021 10:29:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Lee Jones <lee.jones@linaro.org>
Cc: Sean Anderson <sean.anderson@seco.com>,
	kernel@pengutronix.de,
	linux-pwm@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Navid Emamdoost <navid.emamdoost@gmail.com>,
	Ed Blake <ed.blake@sondrel.com>,
	Naidu Tellapati <naidu.tellapati@imgtec.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/5] pwm: Cleanup of variable names used for driver data
Date: Tue, 23 Nov 2021 10:29:34 +0100
Message-Id: <20211123092939.82705-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev

From: Uwe Kleine-König <uwe@kleine-koenig.org>

Hello,

Sean Anderson rightly pointed out that variables holding driver private
data are named badly (in reply to my request to pick a better name than
"pwm" in a new driver). A deeper look into the few that used "pwm" shows
that this name isn't even used consistently.

This series updates these four drivers to use a better name and use that
one consistently.

Uwe Kleine-König (5):
  pwm: img: Rename variable pointing to driver private data
  pwm: tegra: Rename variable pointing to driver private data
  pwm: sun4i: Rename variable pointing to driver private data
  pwm: stmpe: Drop unused setting of driver data
  pwm: stmpe: Rename variable pointing to driver private data

 drivers/pwm/pwm-img.c   | 141 ++++++++++++++++++++--------------------
 drivers/pwm/pwm-stmpe.c |  18 +++--
 drivers/pwm/pwm-sun4i.c |  70 ++++++++++----------
 drivers/pwm/pwm-tegra.c |  58 ++++++++---------
 4 files changed, 142 insertions(+), 145 deletions(-)


base-commit: 136057256686de39cc3a07c2e39ef6bc43003ff6
-- 
2.30.2

