Received: from out-41.mta1.migadu.com (out-41.mta1.migadu.com [95.215.58.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755BA389
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Aug 2023 00:20:43 +0000 (UTC)
Date: Wed, 16 Aug 2023 10:20:06 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1692145242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W/3Bsolx/C/bCd6nOgkXy1stoSxXxl8avJcHTQmWk3I=;
	b=Tpva4ZtkibnK2GpTytK/vDG7PYBOm9kMJYnKeuwzxMdOWTeVMCFi1+0qtNAw1R0lvN8wl+
	86GYlyaAkvxbIamrTP9qBx8pRsqVG6NtyDynpUFbjjfnBQ57lwQLk4o+mCD2+yPowEkhzE
	0+SaVhqII3x4UAQJV7T4lKpOz31dD9E7FiYApEQXU+Ut99HXlGW8o2ANSuyWxf9kkk2cXo
	wmbb2D2gDU7spwwImbbOzcakL/YBE5q9Ic7hYup6eqHdTWxObMCEKPEvh/lSTuW+ut2Jo8
	7bS6zyC8fM0DpbZE5PyZMLMcwYiyJB+yvd9cWpxlpolwUdMN1UBbSkdG2Emw0Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Fawad Lateef <fawadlateef@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux sunXi <linux-sunxi@lists.linux.dev>,
	kernelnewbies <kernelnewbies@kernelnewbies.org>,
	boris.brezillon@collabora.com
Subject: Re: Question regarding Linux-6.3.5 and Sunxi A20 NAND/NFC support
Message-ID: <ZNwWNopPItNwKCTV@titan>
References: <CAGgoGu7Vim82Hu1JKc+m6cPkcn7+WWDFwK5P_YE6grFQS9E21Q@mail.gmail.com>
 <ZNm2ihdTojuPJM2f@debian.me>
 <CAGgoGu5XuHhVbnrNKBzhZyZH993bBHiLgjTrtyofvePZ-dxLow@mail.gmail.com>
 <CAGgoGu5iTE1xeupwTUUAcJv59294dNQJEf9oUWQKF72hrpFxRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGgoGu5iTE1xeupwTUUAcJv59294dNQJEf9oUWQKF72hrpFxRw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Aug 15, 2023 at 11:01:02PM +0100, Fawad Lateef wrote:
> Hi everyone,
> 
> Can someone guide me? I am not sure what I am missing here.
> 
> I am trying to debug the code but I assume that the SUNXI NAND driver
> is supposed to be working and that something is missing from my
> changes and additions to the dts/dtsi for A20 SOM.
> 
> Thanks in advance

Hi there Fawad,

I've hit this problem before and it's usually been because the pins are being
used by another peripheral already

Could you post the kernel log? It might have some notes on this.

John.
