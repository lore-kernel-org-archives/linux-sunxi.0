Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4623931D381
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Jun 2026 05:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280293; cv=none; b=PuBRwYx7Ixi+ZsfJAj5NIicjSsU6CWFXhmfaCily17gE77D3/Vhyb4I6N4ltlRCH+faGKJMde530LIWa8xCSxsyS/DMlr/eyrAYjRwJ/GRSOdMND10+3la+zZo5Wx8EL+dstB85b3dQIh3hD6COz7c9Enlbih7VuBPjlGHfnPtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280293; c=relaxed/simple;
	bh=SbgkBS7NCgBfuBcfPM6R1nAk0QR07hK5xnqSaIuu0x8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lJJTrhHlozmKWh73UCHSBOLys6FUPttbLdLePhyA2hDY913cGsKQBjEBjn+uG5ntt1lsVmHL6Aumvp85zO3OfA0tCmUHg8sYHMoG/G/cGqpw4hw6Gj64VqOLzBMgJNP2rt6xjLLKPu2tQJ1V1NK4XMbOHzwepmhJCmVqnM+f1+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowACXaZBbcDtqZQ2tFQ--.13554S2;
	Wed, 24 Jun 2026 13:51:24 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] drm/sun4i: mixer: Check clock enable failures
Date: Wed, 24 Jun 2026 13:51:23 +0800
Message-ID: <20260624055123.26769-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACXaZBbcDtqZQ2tFQ--.13554S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kry7KFyfXF4rKr4xuFWDCFg_yoW8Wr4kpF
	WfZF1YyrW8J39a9ay3Xr48ZF13Aw4rCFyxG3yDGa40grn0kryUtFyUKFyqgF9Yk3Z5A3W7
	t3WkGrWkuFn8Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUL0edUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

sun8i_mixer_bind() acquires the required bus and module clocks, but
ignores clk_prepare_enable() failures before adding the mixer engine to
the DRM pipeline.

Check both clock enable operations and use the existing unwind labels
when a required clock cannot be enabled.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index ce9c155bfad7..c6546f933b13 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -616,7 +616,11 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		ret = PTR_ERR(mixer->bus_clk);
 		goto err_assert_reset;
 	}
-	clk_prepare_enable(mixer->bus_clk);
+	ret = clk_prepare_enable(mixer->bus_clk);
+	if (ret) {
+		dev_err(dev, "Couldn't enable the mixer bus clock\n");
+		goto err_assert_reset;
+	}
 
 	mixer->mod_clk = devm_clk_get(dev, "mod");
 	if (IS_ERR(mixer->mod_clk)) {
@@ -633,7 +637,11 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (mixer->cfg->mod_rate)
 		clk_set_rate(mixer->mod_clk, mixer->cfg->mod_rate);
 
-	clk_prepare_enable(mixer->mod_clk);
+	ret = clk_prepare_enable(mixer->mod_clk);
+	if (ret) {
+		dev_err(dev, "Couldn't enable the mixer module clock\n");
+		goto err_disable_bus_clk;
+	}
 
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
 
-- 
2.50.1 (Apple Git-155)

