Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A762CA5
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Feb 2023 20:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CFAC433D2;
	Tue, 14 Feb 2023 20:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676408102;
	bh=ostKEzzplobdT7O8KhCmQvHPK9uAmCw1r6JJ+q8gb74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YG+RdaiL++HdQuIoQaz45hlPDQAbwZ887M+7Qco/qQSHCfxBTCDlcCn2G4AX0JmdN
	 Q12x7tnX/j18YihpZRft+xEJPFo6DZQ81UlB7vVdDdoQMXeZGV/VLKj22HRF9oDf1J
	 auwTpKDeJMQXjwb0u68ltFiBWuEU5k5KExWLP4ww9XPeC5SxxjutUJnHGoMZm2pjUl
	 gDf/PAWJdZ+WO8ZzExjw4E/CUATHuQ12fPJLxpTYIQ/N5ZWgDCzTPY14UIpRfTCrft
	 JHwiwBqpTIuOREcHFGPUWMkHG0CkM2oqroDBvAoxSUNAkKH949kTl6VkT86bnXdCdi
	 BHoMRu67GsXxQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bastian Germann <bage@debian.org>
Cc: linux-remoteproc@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Ohad Ben-Cohen <ohad@wizery.com>,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/3] Enable hwlock on Allwinner A64
Date: Tue, 14 Feb 2023 12:57:06 -0800
Message-Id: <167640821432.1045974.5362172074959635497.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213231931.6546-1-bage@debian.org>
References: <20230213231931.6546-1-bage@debian.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 14 Feb 2023 00:19:27 +0100, Bastian Germann wrote:
> The allwinner,sun6i-a31-hwspinlock compatible driver can be used with
> the Allwinner A64 chip. Add the wiring required to enable it.
> 
> The device tree schema needs some work to verify everything that is
> needed by the sun6i hwlock driver.
> 
> The hwlock device was verified to be available with this series applied
> on a Pinebook.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: hwlock: sun6i: Add missing #hwlock-cells
      commit: 25d10262ed8aae71cd2f0b3c0a90d06a6b79fba2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
