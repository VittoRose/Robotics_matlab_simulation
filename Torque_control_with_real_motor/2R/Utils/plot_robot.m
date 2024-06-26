function handle=plot_robot(q,params,real)
    [p0, p1, p2] = RR_chain(q, params);

    if real
        plot(p0(1),p0(2),'ko','linewidth',4);
        handle=plot([p0(1) p1(1) p2(1)],[p0(2) p1(2) p2(2)],'-ko','linewidth',2);
    else
        plot(p0(1),p0(2),'bo','linewidth',4);
        handle=plot([p0(1) p1(1) p2(1)],[p0(2) p1(2) p2(2)],'-bo','linewidth',2);
    end
end