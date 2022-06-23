Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696671FAC
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jun 2022 23:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656026979; x=1687562979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=heSJ8jzY3pZhIPVQZKO6qwVJfpfmlxuwEG6zr2DoHY4=;
  b=AZ6O/87DhTfd5IGac7MtWXxy3NPrehOx+maOtC0HfHfap5ftzsFFJYH1
   ASfNY4obPZbJW4X9TYSxUVjxzFB744Nul3jyLdlHByenhdR49M/HFmRwH
   51dtJHgZCf9eezDCJjgKtVr4K4HJZSelQ2aQWn+F9lT8PB1JgTdWaSGbm
   w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Jun 2022 16:29:35 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 16:29:33 -0700
Received: from quicinc.com (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 23 Jun
 2022 16:29:33 -0700
Date: Thu, 23 Jun 2022 16:29:31 -0700
From: Guru Das Srinagesh <quic_gurus@quicinc.com>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
CC: <broonie@kernel.org>, <agross@kernel.org>, <bjorn.andersson@linaro.org>,
	<srinivas.kandagatla@linaro.org>, <bgoswami@codeaurora.org>,
	<gregkh@linuxfoundation.org>, <rafael@kernel.org>, <cw00.choi@samsung.com>,
	<krzysztof.kozlowski@linaro.org>, <b.zolnierkie@samsung.com>,
	<myungjoo.ham@samsung.com>, <michael@walle.cc>, <linus.walleij@linaro.org>,
	<brgl@bgdev.pl>, <tglx@linutronix.de>, <maz@kernel.org>,
	<lee.jones@linaro.org>, <mani@kernel.org>, <cristian.ciocaltea@gmail.com>,
	<wens@csie.org>, <tharvey@gateworks.com>, <rjones@gateworks.com>,
	<mazziesaccount@gmail.com>, <orsonzhai@gmail.com>, <baolin.wang7@gmail.com>,
	<zhang.lyra@gmail.com>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-actions@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<alsa-devel@alsa-project.org>
Subject: Re: [PATCH 02/49] regmap-irq: Fix offset/index mismatch in
 read_sub_irq_data()
Message-ID: <20220623232931.GA21400@quicinc.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-3-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220620200644.1961936-3-aidanmacdonald.0x0@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)

On Mon, Jun 20, 2022 at 09:05:57PM +0100, Aidan MacDonald wrote:
> We need to divide the sub-irq status register offset by register
> stride to get an index for the status buffer to avoid an out of
> bounds write when the register stride is greater than 1.
> 
> Fixes: a2d21848d921 ("regmap: regmap-irq: Add main status register support")
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Reviewed-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
