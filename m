Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB4E158218
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Oct 2024 09:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729417021; cv=none; b=Br3ePAWKXbTueFHJa9Vjq/tvDniefeS4Blgdagqi4OkvyQOKYAx63VwHj2F8abRGQ7SoWxG9y6zkrAxrFTiBzqfrKqtw4QTmekiWpWLle542alwGNlV+IKjyW4fyZMyh0DqMqh0vVu49dI5fgBNf+V+f1b5KhKglLIU/I1XOV2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729417021; c=relaxed/simple;
	bh=EyvjrBQH9gaPHe01nY8i6dEiX9RqExmByYmwgDK7WXo=;
	h=Message-ID:Date:MIME-Version:Cc:To:From:Subject:Content-Type; b=jDg8zaaKQi37TewCArb0C1UDdIdf+48vJ0903TZhjB0fprhHuCxUqWO5C8lW1LNTycOGurlq9aKiKb0BN5ihd6IdBMFdqKnoff797CgAio1rtwPiylbsRO5EkROo4DQtSn0cWfagm9y52KhvJ3NK2GTPhc4fzyLcHsEODsr9wfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=Jlx3eQxC; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="Jlx3eQxC"
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id 2C7htYlELiA192SMmt562k; Sun, 20 Oct 2024 09:36:52 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id 2SMjtaoGdGNqB2SMktXQeX; Sun, 20 Oct 2024 09:36:51 +0000
X-Authority-Analysis: v=2.4 cv=cqidkU4i c=1 sm=1 tr=0 ts=6714cf33
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=geAcWm3dhgwnT0Pjoka1yw==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=-pn6D5nKLtMA:10 a=jMfKuDRYAAAA:8
 a=MRSqTl_Y5bnSglAJojgA:9 a=QEXdDO2ut3YA:10 a=-3YgmSAAc2L1nfTqJm0e:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:Cc:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KITBDFaLu+p+liV4EGL9fJsqmIbuK3wBQMfUQMiuO9c=; b=Jlx3eQxCVCA5I43XzaOwUsPCKJ
	JO7aFh4FC+MY2cjpSgdiqaBOJLSgC4NaEAsSzUdbty9BCUCh3c3ZUylK6TzywMoSth74wIJdcLyN8
	kLSlMhaL5r4uPQA3ajWhY884TvX3bf+ufICrYuVQ+fFpkr9+fH6fnUrYEoUwcrxBx0eVnCnbze9hI
	M72sU5El1BhZbcj9rdxyRphly3GcYKkCNjQvxwM5HF2+4jjJHV8jWPHR5hsziXBeOniWahkmL+m7c
	tDLHWn0YIKXpSn4I9Qcn+8R6BH7BsV0dahpJQ2dOolZjCb8/S2Hbg4Rs5Vqs8kpgsQTEKf5SxL2YM
	yGfQCNvQ==;
Received: from [49.206.112.194] (port=10042 helo=[192.168.0.206])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1t2SMi-001xFP-1D;
	Sun, 20 Oct 2024 15:06:48 +0530
Message-ID: <2dc2c052-8fde-4656-8dbf-a6980cd968ae@linumiz.com>
Date: Sun, 20 Oct 2024 15:06:46 +0530
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org
From: Parthiban <parthiban@linumiz.com>
Subject: A133 support
Organization: Linumiz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 49.206.112.194
X-Source-L: No
X-Exim-ID: 1t2SMi-001xFP-1D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.206]) [49.206.112.194]:10042
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 2
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBpHHpfEXVzz56iEgGzbVVMkMKbwVORvmPHuxn2gqWL7CEjqN5q66fUxK/TI1AdZ2jtZ/VksjX3jGx7nZ72h/gXZaKGYYSE+8M/ycZRd6bkW5/v7Fm3X
 iz4X/PGjY1SAXAakVPc7/cLKwh1/16rf6GizhbpDhwyNMFeIFL26Qeg6UgFsUEJj/jCbGtRn//V3i5fTAiHtVIXgbZ+EH3TxXgg=

Hi All,

Am currently adding support for Allwinner A133 SoC based on A100. Based on the [1],
A100 and A133 uses same IP across. But there is no public available datasheet or
user manual for A100.

Should A100 kept as base and A133 dtsi needs to added on top or A133 can be duplicated
into a new devicetree?

[1]: https://linux-sunxi.org/Linux_mainlining_effort#Status_Matrix

-- 
Thanks,
Parthiban N

