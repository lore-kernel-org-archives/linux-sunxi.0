Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B65F2F28E3
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Mar 2026 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803890; cv=none; b=dAABoQKF4dCo04IeoYE8+xnA3VxW4+EA125XVocCxTk6jpy0mWMgM25PRDjrms2oKDfRslhmIOTvm5RuO+Mt1tzz5+m9ERSb3Hqc7PyXFICrvVCq2vK8mktE76EUSdYxqIShM/T8SGCmLj0+reRlQgYBXaHZPLlGnNHmggm05pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803890; c=relaxed/simple;
	bh=5uhmmg7vWSZplBpTH9YTFXdl0i8LhLBtJ0Gmk/1FLVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=STMCzfkPDY8DXopY5avZxrgke+02kINnnnodzr4OuLIATiPTszmjHgU+eY3cqIVXt3Eio25cDF+1Ed87ZJJzEov/bnfMVZGOrG3YAxJ8c5P+P9TmULtCYUDhnXZaNGY8gg5x9UXA13nFFQ0vee1FiSjJXUV8vAqq0kHCbElwv3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dSp9M74c; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dSp9M74c"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A987E4E42597;
	Fri,  6 Mar 2026 13:31:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F07D5FF92;
	Fri,  6 Mar 2026 13:31:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BA61103699F4;
	Fri,  6 Mar 2026 14:31:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772803886; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5qjLEAIOM/x5LTkseOtlz5V4adYllqJnixHsyNEVKMk=;
	b=dSp9M74cgTh3Myvz930z+Pkb8FeyXYlq/Xbl8c9f07aZ4QW4SevEdAzFaAMH0nhC9N7PwR
	/Grp2B+bQXDwC4xqRIFmrJBeDK0YDV2TCsmPesgfAzOTXPQQg6iwoCtcJ/LguHRXl4SXlJ
	ky5CVrr7zFu6ydudEUBsM4Y+D+J219l3yNE8GJqMyMMVNuAT53GO6NSX3V0EORX4QyK+n+
	aQJvzszeUnoBmiXC1udTHzI4SnjhlTGMqkLnPDbnT8luMdezeKY69ONQvyLNKyoeRkGgvB
	4+4Tft/fcFOWW7BhMqUwS/pVH//zfnermFLGlObfDxKkeZJoANyzJxQwUZErug==
Message-ID: <310c465e-0956-48ca-9887-cdd1ad0db58d@bootlin.com>
Date: Fri, 6 Mar 2026 14:31:24 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 7/8] net: stmmac:
 mdio_bus_data->default_an_inband is boolean
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Samuel Holland <samuel@sholland.org>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
 <E1vy6AT-0000000BtxD-2qm7@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vy6AT-0000000BtxD-2qm7@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 05/03/2026 11:42, Russell King (Oracle) wrote:
> default_an_inband is declared as an unsigned int, but is set to true/
> false and is assigned to phylink_config's member of the same name
> which is a bool. Declare this also as a bool for consistency.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

